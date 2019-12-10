class DashboardController < ApplicationController
  require 'net/http'
  require 'json'

  def index
    # Get News
    @url = 'https://min-api.cryptocompare.com/data/v2/news/?lang=EN'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @news = JSON.parse(@response)

    # Get Prices
    @prices_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,XRP,BCH,EOS,LTC,ADA,XLM,MIOTA,USDT,TRX&tsyms=USD'
    @prices_uri = URI(@prices_url)
    @prices_response = Net::HTTP.get(@prices_uri)
    @prices = JSON.parse(@prices_response)
  end

  def prices
    @symbol = !params[:sym].nil? ? params[:sym].upcase : params[:sym]

    # Get Prices
    @lookup_url = "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=#{@symbol}&tsyms=USD"
    @lookup_uri = URI(@lookup_url)
    @lookup_response = Net::HTTP.get(@lookup_uri)
    @lookup = JSON.parse(@lookup_response)
  end
end
