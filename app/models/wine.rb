class Wine < ActiveRecord::Base
  def self.search(criteria)
    Wine.find(:all, :conditions => ["wine_type = ?", criteria[:color]])
  end
end
