# frozen_string_literal: true

require "test_helper"

class Homeland::SiteTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Homeland::Site
  end

  test "url validation" do
    site = ::Site.new(name: "Google", site_node_id: 1, url: "https://www.google.com")
    assert_equal true, site.valid?

    site = ::Site.new(name: "Google", site_node_id: 1, url: "www.google.com")
    assert_equal false, site.valid?
    assert_equal ["is invalid"], site.errors[:url]

    site = ::Site.new(name: "Google", site_node_id: 1, url: "//www.google.com")
    assert_equal false, site.valid?
    assert_equal ["is invalid"], site.errors[:url]
  end

  test "favicon_url" do
    site = ::Site.new(url: "https://www.google.com")
    assert_equal "https://favicon.ruby-china.com/ip2/google.com.ico", site.favicon_url

    site = ::Site.new(url: "http://google.com")
    assert_equal "https://favicon.ruby-china.com/ip2/google.com.ico", site.favicon_url

    site = ::Site.new(url: "http://support.google.com")
    assert_equal "https://favicon.ruby-china.com/ip2/support.google.com.ico", site.favicon_url

    site = ::Site.new(url: "httpgooglecom")
    assert_equal "", site.favicon_url
  end
end
