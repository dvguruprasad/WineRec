class WinesController < ApplicationController
  def index
  end

  def recommendations
    @wine = Wine.find(params[:id])
    @recommendations = Similarity.similar_to(@wine)
  end
end
