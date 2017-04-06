class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
  	song = Song.new
  	song.save
  	return song
  end

  def Song.new_by_name(name)
  	song = Song.new
  	song.name = name
  	return song
  end

  def Song.create_by_name(name)
  	song = Song.new_by_name(name)
  	song.save
  	return song
  end

  def Song.find_by_name(name)
  	@@all.find {|song| song.name == name}
  end

  def Song.find_or_create_by_name(name)
  	song = Song.new_by_name(name)
  	if @@all.include?(song)
  		return song
  	end
  	song.save
  	return song
  end

  def Song.alphabetical
  	return @@all.sort_by {|song| song.name}
  end

  def Song.new_from_filename(filename)
  	filename = filename.gsub(".mp3", "").split(" - ")
  	song = Song.new
  	song.name = filename.last
  	song.artist_name = filename.first
  	return song
  end

  def Song.create_from_filename(filename)
  	song = Song.new_from_filename(filename)
  	song.save
  	return song
  end

  def Song.destroy_all
  	@@all.clear
  end


end
