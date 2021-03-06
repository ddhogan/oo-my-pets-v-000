class Owner
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []

  def initialize(species)
  	@species = species
  	@@all << self
  	@pets = {fishes: [], cats: [], dogs: []}
  end

  def say_species
  	"I am a human."
  end

  def self.all
  	@@all
  end

  def self.count
  	@@all.count
  end

  def self.reset_all
  	@@all.clear
  end

  def buy_fish(name)
  	new_fish = Fish.new(name)
  	@pets[:fishes] << new_fish
  end

  def buy_cat(name)
  	new_cat = Cat.new(name)
  	@pets[:cats] << new_cat
  end

  def buy_dog(name)
  	new_dog = Dog.new(name)
  	@pets[:dogs] << new_dog
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

  def sell_pets  #find a way to do this that iterates through the hash in one step
  	# @pets[:dogs].each {|pet| pet.mood = "nervous"}
  	# @pets[:cats].each {|pet| pet.mood = "nervous"}
  	# @pets[:fishes].each {|pet| pet.mood = "nervous"}
  	# @pets = {}

  	@pets.each do  |species, animals|
  		animals.each do |animal|
  			animal.mood = "nervous"
  		end
  		animals.clear
  	end
  end

  def list_pets
  	"I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end
end