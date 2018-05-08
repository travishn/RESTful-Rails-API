# == Schema Information
#
# Table name: artworks
#
#  id        :bigint(8)        not null, primary key
#  title     :string
#  image_url :string
#  artist_id :integer
#

class Artwork < ApplicationRecord
  validates :title, :artist_id, :image_url, presence: true
  validates_uniqueness_of :title, :scope => :artist_id

  belongs_to :artist,
    class_name: :User,
    foreign_key: :artist_id,
    primary_key: :id

  has_many :artwork_shares,
    class_name: :ArtworkShare,
    foreign_key: :artwork_id,
    primary_key: :id,
    dependent: :destroy

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

    has_many :comments,
      class_name: :Comment,
      foreign_key: :artwork_id,
      primary_key: :id,
      dependent: :destroy

end
