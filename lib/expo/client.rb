require 'json'
require 'net/http'

module Expo
  class Client
    attr_accessor :token
    BASE_URL = "http://localhost:9292/"

    def initialize token
      raise ArgumentError if token.nil?
      @token = token
    end

    # Gets projects from expo REST API
    def projects
      uri = URI.parse(build_url "projects")

      fetch uri
    end

    def build_url type
      "#{BASE_URL}#{type}?token=#{@token}"
    end

    def fetch uri
      response = Net::HTTP.get_response uri
      parse response.body
    end

    private

    def parse data
      JSON.parse data
    end

  end
end