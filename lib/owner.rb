class Owner
	attr_reader :species
	attr_accessor :name, :pets

	@@all = []

	def initialize(spec=nil)
		@species = spec if spec
		@pets = {fishes:[], dogs:[], cats:[]}
		@@all << self
	end

	def pets
		@pets
	end

	def self.count
		@@all.length
	end

	def self.all
		@@all
	end

	def self.reset_all
		all.clear
	end

	def say_species
		"I am a #{@species}."
	end

	def buy_fish(name)
		@pets[:fishes] << Fish.new(name)
	end

	def buy_dog(name)
		@pets[:dogs] << Dog.new(name)
	end

	def buy_cat(name)
		@pets[:cats] << Cat.new(name)
	end

	def feed_fish
		@pets[:fishes].each {|fish| fish.mood = 'happy'}
	end

	def walk_dogs
		@pets[:dogs].each {|dog| dog.mood = 'happy'}
	end

	def play_with_cats
		@pets[:cats].each {|cat| cat.mood = 'happy'}
	end

	def sell_pets
		@pets.each do |type, pet_list|
			pet_list.each do |pet|
				pet.mood = 'nervous'
			end
		end
		@pets.clear
	end

	def list_pets
		"I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
	end
end