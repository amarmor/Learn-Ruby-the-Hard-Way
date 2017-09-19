class User

  attr_reader :name, :favorite

  def self.say_bye(name)
    puts "#{name} says, 'Peace out'"
  end

  def initialize(name, favorite_color)
    @name = name
    @favorite_color = favorite_color
  end

  def say_hi
    puts name + " says hi!"
  end

end
