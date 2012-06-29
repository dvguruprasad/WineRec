require 'spec_helper'

class SimilaritySpec
  describe "#similar_to" do
    it "returns wines most similar to given wine" do
      wine = Wine.find 3
      similar_wines = Similarity.similar_to(wine)
      similar_wines.count.should_not be_nil
      # p "Wines similar to #{wine.name}, sweetness:#{wine.sweetness}, type:#{wine.wine_type}, body:#{wine.body}, vintage: #{wine.vintage}, varietal:#{wine.varietal}"
      p "Wines similar to"
      print_wine(wine)
      p "-----------------------------------------"
      similar_wines.each do |w, similarity_score|
        print_wine(w, similarity_score)
      end
    end
    def print_wine(wine, similarity_score=nil)
      p "#{wine.name}, sweetness:#{wine.sweetness}, type:#{wine.wine_type}, body:#{wine.body}, vintage: #{wine.vintage}, varietal:#{wine.varietal}, similarity_score: #{similarity_score}"
    end
  end
end
