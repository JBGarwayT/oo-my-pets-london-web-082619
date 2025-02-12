require 'pry'

class Owner
  # code goes here
  attr_accessor :mood
  attr_reader :name, :species

  @@all = []

  def initialize (name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end
  
  def self.all 
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select{|cats| cats.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat (cat)
    Cat.new(cat, self) 
  end

  def buy_dog (dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.each{|dog| dog.mood = "happy"}
      
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    pets = dogs + cats
    pets.each {|animal| animal.mood = "nervous"}
    pets.each {|animal| animal.owner = nil}
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end