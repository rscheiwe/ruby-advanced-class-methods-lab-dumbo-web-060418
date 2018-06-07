class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    #@@all << song
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    x = self.find_by_name(name)
    if x # ==> evaluates to nil/false
      x
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|name| name.name }
  end

  def self.new_from_filename(info)
    info = info.split(/[-.]/)
    song = self.new
    song.artist_name = info[0].strip
    song.name = info[1].strip
    song
  end

  def self.create_from_filename(info)
    song = new_from_filename(info)
    @@all << song
  end
  
  def self.destroy_all
    @@all.clear
  end


end
