class Recommender
  def Recommender.recommend_for(user)
    ratings = user.ratings
    similar_wines= {}
    ratings.each do |rating|
      similar_wines[rating.value] = Similarity.similar_to(Wine.find(rating.wine_id))
    end
    similar_wines.sort_by{|rating, wines| rating}.reverse
    recommendations = {}
    similar_wines.each do |key, wines|
      wines.each do |wine, similarity_score|
        recommendations[wine] = similarity_score if !recommendations.keys.include?(wine)
      end
    end
    recommendations
  end
end
