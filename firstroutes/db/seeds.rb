# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 100.times do
# user = Faker::Internet.unique.user_name
# User.create!(username: user)
# end
#
# 100.times do
#   atitle = Faker::Hipster.sentence(4)
#
#   url = Faker::Internet.url
#
#   aid = (1..100).to_a.sample
#
#   Artwork.create!(title: atitle, artist_id: aid, image_url: url )
# end

1000.times do
  aid = (1..100).to_a.sample

  uid = (1..100).to_a.sample
  next if ArtworkShare.find_by(artwork_id: aid, viewer_id: uid)
  ArtworkShare.create!(artwork_id: aid, viewer_id: uid)
end
