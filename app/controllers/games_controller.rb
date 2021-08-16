require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    grid = Array.new(9) { ('A'..'Z').to_a.sample }
    @letters = grid.join(" ")
  end

  def score
    @input = params[:word]
    if response = URI.open("https://wagon-dictionary.herokuapp.com/#{@input}")
      json = JSON.parse(response.read)
      @response = json['found']
      # @response = "Valid!"
    end
  end
end
