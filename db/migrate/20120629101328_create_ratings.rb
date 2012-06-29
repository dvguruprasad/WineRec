class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :wine_id
      t.float :rating
      t.timestamps
    end
  end
end
