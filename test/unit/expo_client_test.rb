require 'minitest/autorun'
require 'minitest/colorize'
require './lib/expo/client'
require './test/unit/helper'

module Expo
  class ClientTest < MiniTest::Unit::TestCase
    TOKEN = 123
    BASE_URL = "http://localhost:9292/"

    def setup
      @client = Client.new TOKEN
    end

    def test_initialize_without_token_raises_error
      assert_raises(ArgumentError) { client = Client.new }
    end

    def test_initialize_with_token_sets_token
      assert_equal TOKEN, @client.token
    end

    def test_urls_must_contain_token
      url = @client.build_url "project"
      assert_equal true, url.include?("token")
    end

    def test_build_url_for_projects
      url = @client.build_url "projects"
      assert_equal "#{BASE_URL}projects?token=123", url
    end

    def test_projects_successful
      sample = FakeRequestHelper.read 'projects'

      # Do not hit the network
      # Mock the class method on the fly
      klass = Class.new(Client) do
        define_method(:projects) { sample }
      end

      projects = klass.new(TOKEN).projects

      assert_equal 200, projects["status"]
    end

  end
end
