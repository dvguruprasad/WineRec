class WinesController < ApplicationController
  def index
    @search_criteria = params[:search_criteria] || {:color => "red"}
    @wines = Wine.search(@search_criteria)
    @body_scales = body_scales
    @sweetness_scales = sweetness_scales
  end

  def recommendations
    @user = User.find(params[:id])
    @wines_rated_by_user = {}
    @user.ratings.each {|r| @wines_rated_by_user[Wine.find(r.wine_id)] = r.value}
    @recommendations = Recommender.recommend_for(@user)
    @body_scales = body_scales
  end

  private 
  def body_scales
    {0 => "Light", 1 => "Medium Light", 2 => "Medium Bodied", 3 => "Medium Full", 4 => "Full Bodied"}
  end

  def sweetness_scales
    {1 => "Dry (Extra Brut)", 2 => "Dry (Brut)", 3 => "Medium Dry(Extra Dry)", 4 => "Medium Dry", 
      5 => "Medium(Sec)", 6 => "Medium Sweet", 7 => "Medium Sweet(Demi)", 8 => "Sweet", 9 => "Sweet(Doux)"}
  end
end
