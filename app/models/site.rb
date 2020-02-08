# frozen_string_literal: true

class Site < ApplicationRecord
  include SoftDelete

  belongs_to :site_node
  belongs_to :user

  validates :url, :name, :site_node_id, presence: true
  validates :url, format: { with: /https?:\/\/[\S]+/ }, uniqueness: { case_sensitive: false }

  after_save :update_cache_version
  after_destroy :update_cache_version
  def update_cache_version
    # 记录节点变更时间，用于清除缓存
    CacheVersion.sites_updated_at = Time.now.to_i
  end

  def favicon_url
    return "" if url.blank?
    domain = URI.parse(url.strip).host.sub("www.", "")
    "https://favicon.ruby-china.com/ip2/#{domain}.ico"
  rescue
    ""
  end
end
