require('pry-byebug')
require_relative('models/artists')
require_relative('models/albums')
# Artist.delete_all()
# Album.delete_all()

artist1 = Artist.new({
  "name" => "Black Sabbath"
  })
  artist1.delete()


  artist2 = Artist.new({
    "name" => "Jethro Tull"
  })
  artist2.save()

  artist3 = Artist.new({
    "name" => "Alice",
    "last_name" => "Cooper"
    })
  artist3.save()

  album1 = Album.new({
    "name" => "Black Sabbath",
    "genre" => "Classic Rock",
    "artist_id" => artist1.id
    })
  album1.save()

  album2 = Album.new({
    "name" => "Technical Ecstasy",
    "genre" => "Classic Rock",
    "artist_id" => artist1.id
    })
  album2.save()

  album3 = Album. new({
    "name" => "Aqualung",
    "genre" => "Folk Rock",
    "artist_id" => artist2.id
    })
  album3.save()

  album4 = Album. new({
    "name" => "Welcome to My Nightmare",
    "genre" => "Classic Rock",
    "artist_id" => artist3.id
    })
  album4.save()

binding.pry
nil
