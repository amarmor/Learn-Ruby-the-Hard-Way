## Animal is-a object look at the extra credit
class Animal
end

## is-a
class Dog < Animal

  def initialize(name)
    ## has-a
    @name = name
  end
end

## is-a
class Cat < Animal

  def initialize(name)
    ##has-a
    @name = name
  end
end

## is-a
class Person

  def initialize(name)
    ## has-a
    @name = name

    #Person has-a pet of some kind
    @pet = nil
  end

  attr_accesor :pet
end

## is-a
class Employee < Person

  def initialize(name, salary)
    ## has-a
    super(name)
    ## has-a
    @salary = salary
  end

end

## is-a
class Fish
end

## is-a
class Salmon < Fish
end

## is-a
class Habilut < Fish
end

## rober is-a Dog
rober = Dog.new("Rover")

##has-a
satan = cat.new("Satan")

## has-a
mary = Person.new("Mary")

## has-a
mary.pet = satan

##has-a
frank = Employee.new("Frank", 120000)

## has-a
frank.pet = rober

## has-a
flipper = Fish.new()

## has-a
crouse = Salmon.new()

#has-a
harry = Halibut.new()


