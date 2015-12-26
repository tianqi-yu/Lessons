class CreateAlbumsGenres < ActiveRecord::Migration
  def change
  	create_join_table :albums, :genres
  end
end
