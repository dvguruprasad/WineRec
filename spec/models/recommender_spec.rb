require 'spec_helper'

class RecommenderSpec
  describe "#recommend_for" do
    it "recommends items similar to items rated by user" do
      user = User.create(:name => "ninja", :email => "ninja@foo.com")
      recommendations = Recommender.recommend_for()
    end
  end
end
