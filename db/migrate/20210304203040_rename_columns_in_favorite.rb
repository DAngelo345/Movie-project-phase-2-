class RenameColumnsInFavorite < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :movie_id_id, :movie_id
    rename_column :favorites, :user_id_id, :user_id


  end
end
