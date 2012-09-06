require 'seed/wine_populator'
require 'seed/wine_type_similarity_scores_populator'

class String
  def self.split_respecting_double_quotes(str, delim)
    result = []
    current_word = ''
    encountered_quotes = false
    str.each_char do |char|
      if(char == "\"" && !encountered_quotes)
        encountered_quotes = true
        next
      end

      if(char == "\"" && encountered_quotes)
        encountered_quotes = false
        next
      end

      if(encountered_quotes)
        current_word << char
        next
      end

      if(char == delim)
        result.push(current_word)
        current_word = ''
      else
        current_word << char
      end
    end
    result.push(current_word) if '' != current_word
    result.collect {|r| r.strip}
  end
end
Wine.destroy_all
WineTypeSimilarityScore.destroy_all
Rating.destroy_all
User.destroy_all

WinePopulator.new(File.dirname(__FILE__) + '/../data/wine_list.csv').populate
WineTypeSimilarityScoresPopulator.new(File.dirname(__FILE__) + '/../data/wine_type_similarity_scores.csv').populate
user = User.create(:name => "Chuck", :email => "chuck@norris.com")
wine_1 = Wine.find(:first, :conditions => ["wine_type = ?", "Red"])
wine_2 = Wine.find(:first, :conditions => ["wine_type = ?", "White"])
Rating.create(:user_id => user.id, :wine_id => wine_1.id, :value => 4)
Rating.create(:user_id => user.id, :wine_id => wine_2.id, :value => 3)
