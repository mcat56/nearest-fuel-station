class SearchController < ApplicationController


  def index
    binding.pry
    render locals: { facade: DirectionsFacade.new(params['location']) }
  end


end
