# == Schema Information
#
# Table name: users
#
#  id       :bigint(8)        not null, primary key
#  username :string
#

class User < ApplicationRecord
  validates :username, presence: true
  has_many :artworks,
    class_name: :Artwork,
    foreign_key: :artist_id,
    primary_key: :id,
    dependent: :destroy

  has_many :artwork_shares,
    class_name: :ArtworkShare,
    foreign_key: :viewer_id,
    primary_key: :id,
    dependent: :destroy

  has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork


end
