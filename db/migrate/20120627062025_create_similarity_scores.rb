class CreateSimilarityScores < ActiveRecord::Migration
  def change
    create_table(:similarity_scores) do |t|
      t.integer :wine_1
      t.integer :wine_2
      t.float :similarity_score
      t.timestamps
    end
  end
end
