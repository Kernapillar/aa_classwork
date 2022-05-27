# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

adam = User.create(username: 'Adam')
alan = User.create(username: 'Alan')
alec = User.create(username: 'Alec')
alex = User.create(username: 'Alex')
anthonie = User.create(username: 'Anthonie')
brian = User.create(username: 'Brian')
User.create(username: 'Charlie')
User.create(username: 'Cindy')
User.create(username: 'Danny')
User.create(username: 'Evie')
User.create(username: 'Ignacio')
User.create(username: 'Lucy')
User.create(username: 'Quang')
User.create(username: 'Wendy')
User.create(username: 'Jacob')
User.create(username: 'Peter')
User.create(username: 'Zuzu')

Artwork.create!(title: "Mona Lisa", image_url: "mona/lisa.com", artist_id: 5)
Artwork.create!(title: "Starry night", image_url: "starry/night.com", artist_id: 3)
Artwork.create!(title: "bowl of fruit painting", image_url: "fruits.com", artist_id: 2)
Artwork.create!(title: "an upclose picture of a bug", image_url: "upclose/bug.com", artist_id: 14)
Artwork.create!(title: "black and white lanscape", image_url: "landscape/nocolor.com", artist_id: 1)
Artwork.create!(title: "dog and pig friends", image_url: "piggo.com", artist_id: 13)
Artwork.create!(title: "abstract picture of an apple", image_url: "apple.com", artist_id: 17)
Artwork.create!(title: "selfie picture", image_url: "me.com", artist_id: 4)

ArtworkShare.create!(artwork_id: 1, viewer_id: 6 )
ArtworkShare.create!(artwork_id: 2, viewer_id: 3 )
ArtworkShare.create!(artwork_id: 2, viewer_id: 5 )
ArtworkShare.create!(artwork_id: 3, viewer_id: 5 )
ArtworkShare.create!(artwork_id: 6, viewer_id: 11 )
ArtworkShare.create!(artwork_id: 7, viewer_id: 14 )
ArtworkShare.create!(artwork_id: 5, viewer_id: 1 )
ArtworkShare.create!(artwork_id: 1, viewer_id: 16 )