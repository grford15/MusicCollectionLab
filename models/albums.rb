require('pg')
require_relative('../db/sql_runner.rb')
require_relative('./artist.rb')

class Album

  attr_accessor :name, :title, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id']
  end

  def save
    sql = "INSERT INTO albums (name, title, genre, artist_id)
    VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@name, @title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.all
    sql = "SELECT * FROM albums"
    collect = SqlRunner.run(sql)
    return collect.map { |discs| Album.new(discs)}
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.find(name)
    sql = "SELECT * FROM albums WHERE name = $1"
    values = [name]
    results = SqlRunner.run(sql, values)
    name_hash = results.first
    return Album.new(name_hash)
  end
end
