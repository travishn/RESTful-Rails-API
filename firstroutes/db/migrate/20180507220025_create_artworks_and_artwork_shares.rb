class CreateArtworksAndArtworkShares < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :image_url
      t.integer :artist_id
    end
    add_index :artworks, [:title,:artist_id], unique: true
    add_index :artworks, :artist_id, unique: true

    create_table :artwork_shares do |t|
      t.integer :artwork_id, null: false
      t.integer :viewer_id, null: false
    end
    add_index :artwork_shares, :artwork_id, unique: true
    add_index :artwork_shares, :viewer_id, unique: true
  end
end
