class Similarity
  WINE_TYPE_WEIGHT = 40
  BODY_WEIGHT = 30
  VINTAGE_WEIGHT = 20
  VARIETAL_WEIGHT = 10

  def Similarity.similar_to(wine)
    all_wines = Wine.find(:all, :conditions => ["sweetness=?", wine.sweetness])
    similarity_scores = {}
    result = {}
    all_wines.each do |w|
      next if w.name == wine.name
      similarity_scores[w] = similarity_score(wine, w)
    end
    sorted = similarity_scores.sort_by{|key, value| value}.reverse
    sorted.each{|value| result[value[0]] = value[1]}
    result
  end

  def Similarity.similarity_score(wine1, wine2)
    wine_type_similarity = WineTypeSimilarityScore.for(wine1.wine_type, wine2.wine_type)
    body_similarity = similarity_between_numerals(wine1.body, wine2.body, 5.0)
    vintage_similarity = vintage_similarity(wine1.vintage, wine2.vintage)
    wine_type_similarity * WINE_TYPE_WEIGHT + body_similarity * BODY_WEIGHT + vintage_similarity * VINTAGE_WEIGHT
  end

  def Similarity.similarity_between_numerals(numeral_1, numeral_2, total_number)
    (total_number - (numeral_1 - numeral_2).abs) / total_number
  end

  def Similarity.vintage_similarity(vintage_1, vintage_2)
    return 0 if(vintage_1 == 0 or vintage_2 == 0)
    similarity_between_numerals(vintage_1, vintage_2, 300.0)
  end
end
