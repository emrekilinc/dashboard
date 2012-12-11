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

    def create_project params
      uri = URI.parse(build_url_without_token "project/new")

      # Add token to params
      params[:token] = @token
      response = Net::HTTP.post_form(uri, params)

      response
    end

    def destroy_project params
      uri = URI.parse(build_url_without_token "project/destroy")
      
      # Add token to params
      params[:token] = @token
      response = Net::HTTP.post_form(uri, params)

      response
    end

    # Gets exceptions by limit
    def exceptions limit = 0
      uri = URI.parse(build_url "exceptions/#{limit}")
      
      fetch uri
    end

    def build_url type
      "#{BASE_URL}#{type}?token=#{@token}"
    end

    def build_url_without_token type
      "#{BASE_URL}#{type}"
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
