require 'byebug' 
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def notes_attributes=(attributes)
    attributes.each do |attribute|
      if !attribute.empty?
        note = Note.create(content: attribute)
        self.notes << note
      end
    end
  end

  def artist_name=(name)
    if Artist.find_by(name: name)
      self.artist = Artist.find_by(name: name)
    else
      self.artist = Artist.create(name: name)
    end
  end

  def artist_name
    if self.artist
      self.artist.name
    end
  end
end
