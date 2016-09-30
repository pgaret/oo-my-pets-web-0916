class Owner

  attr_reader :species
  attr_accessor :name, :pets


  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @species = "human"
    @pets = {fishes: [], dogs: [], cats: []}
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end

  def self.count
    @@all.count
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    @pets[:fishes].push(Fish.new(name))
  end

  def buy_cat(name)
    @pets[:cats].push(Cat.new(name))
  end

  def buy_dog(name)
    @pets[:dogs].push(Dog.new(name))
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each {|fish| fish.mood = "happy"}
  end


  def sell_pets
    @pets.values.flatten.map! {|pet| pet.mood = "nervous"}
    @pets = {fishes: [], dogs: [], cats: []}
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end

end
