class SearchController < ApplicationController


  def index
    render locals: { facade: DirectionsFacade.new(params['location']) }
  end


end
