require 'expo/client'

class HomeController < ApplicationController
  TOKEN = 123

  # GET : '/'
  def index
    client = Expo::Client.new TOKEN
    @projects = client.projects
    @exceptions = client.exceptions 25
  end

  def about
  end

end
