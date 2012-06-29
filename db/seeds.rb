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

WinePopulator.new(File.dirname(__FILE__) + '/../data/wine_list.csv').populate
WineTypeSimilarityScoresPopulator.new(File.dirname(__FILE__) + '/../data/wine_type_similarity_scores.csv').populate
