class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    @artist_name
  end


  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    @genre_name
  end

  def note_ids=(ids)
    ids.each do |id|
      note = Note.find(id)
      self.notes << note
    end
  end
end
