class AddOwnerToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :owner_id, :integer

  end
end
