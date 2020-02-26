class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def notes_contents=(contents)
    contents.each do |content|
      if !content.empty?
        note = Note.find_or_create_by(content: content)
        self.notes << note
      end
    end
  end

  def notes_contents
    self.notes.map do |note|
      note.content
    end
  end

end
