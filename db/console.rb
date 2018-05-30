require ('pry-byebug')
require_relative('../models/artist.rb')
require_relative('../models/albums.rb')

Artist.delete_all
Album.delete_all

artist1 = Artist.new({'name' => 'Chance the Rapper'})
artist2 = Artist.new({'name' => 'A$AP Rocky'})

album1 = Album.new({
  'name' => 'Chance The Rapper',
  'title' => 'Coloring Book',
  'genre' => 'Hip-Hop',
  'artist_id' => artist1.id
  })

album2 = Album.new ({
  'name' => 'A$AP Rocky',
  'title' => 'TESTING',
  'genre' => 'Hip-Hop',
  'artist_id' => artist2.id
  })

artist1.save
album1.save
artist2.save
album2.save



binding.pry
nil
