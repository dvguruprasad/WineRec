class CreateWinesTable < ActiveRecord::Migration
  def change
    create_table(:wines) do |t|
      t.string :name
      t.integer :vintage
      t.string :varietal
      t.string :wine_type
      t.string :country
      t.string :region
      t.float :rating
      t.integer :body
      t.integer :sweetness
      t.float :price
      t.timestamps
    end
  end
end
