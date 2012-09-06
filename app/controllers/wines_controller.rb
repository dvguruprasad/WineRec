class WinesController < ApplicationController
  def index
  end

  def recommendations
    @user = User.find(params[:id])
    @wines_with_ratings = {}
    @user.ratings.each {|r| @wines_with_ratings[Wine.find(r.wine_id)] = r.value}
    @recommendations = Recommender.recommend_for(@user)
  end
end
