class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.decimal :length
      t.string :director
      t.text :plot

      t.timestamps null: false
    end
  end
end
