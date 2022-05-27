class UpdateArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :artist_id, :integer, null: false 
    add_index :artworks, [:artist_id, :title], unique: true 
    
  end
end
