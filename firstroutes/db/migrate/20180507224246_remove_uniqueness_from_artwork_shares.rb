class RemoveUniquenessFromArtworkShares < ActiveRecord::Migration[5.1]
  def change
    remove_index :artwork_shares, :artwork_id
    remove_index :artwork_shares, :viewer_id
  end
end
