class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user_id
      t.references :movie_id
      t.decimal :rating

      t.timestamps null: false
    end
  end
end
