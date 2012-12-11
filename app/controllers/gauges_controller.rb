require "gauges_api"

class GaugesController < ApplicationController
  TOKEN = "3ecf53c21a9ce986710c09a2566e91bc"

  def gauges
    client = Gauges::Client.new TOKEN
    gauges = client.gauges

    render json: gauges
  end
end
