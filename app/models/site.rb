class Site < ApplicationRecord
  include SoftDelete

  belongs_to :site_node
  belongs_to :user

  validates :url, :name, :site_node_id, presence: true
  validates :url, format: { with: /https?:\/\/[\S]+/ }, uniqueness: true

  after_save :update_cache_version
  after_destroy :update_cache_version
  def update_cache_version
    # 记录节点变更时间，用于清除缓存
    CacheVersion.sites_updated_at = Time.now.to_i
  end

  def favicon_url
    return '' if url.blank?
    # 又拍云获取ico不能携带www.前缀, 以及域名以/结尾时清除它
    domain = url.gsub(%r{(http[s]{0,1}:\/\/(www\.)?|/$)}, '')
    "https://favicon.b0.upaiyun.com/ip2/#{domain}.ico"
  end
end