require 'expo/client'

class ProjectController < ApplicationController 
  TOKEN = 123

  def create
    client = Expo::Client.new TOKEN
    project = client.create_project params

    redirect_to :controller  => 'home', :action => 'index'
  end

  def detail
    client = Expo::Client.new TOKEN
    @project = client.detail_project params[:project_code]
  end

end
