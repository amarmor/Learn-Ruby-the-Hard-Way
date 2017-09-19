# Escape from the Misty Mountains. You're captured by goblins, fight them off, run away, find the ring, find gollum, beat the riddle challenge, put on the ring, and escape the mountains.
#
# Captured by goblins
# Run away
# Find the ring and gollum
# Beat the riddle challenge
# Escape the mountains
#
# SCENE
# Captured by goblins
# Find the ring and gollum
# Escape
#
# ACTIONS
# Run away
# Answer the riddle challenge
# Put on the ring
#
# SEQUENCES
# First scene
# next scene
# terminate
#

class Scene

  def enter()
    puts "The Scene class should only be used by inheriting as a subclass."
    exit(1)
  end

end

class Engine

  def initialize(scene_map) # this creates the @scene_map variable
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene() # goes to @scene_map, finds opening_scene, and sets it to current_scene
    last_scene = @scene_map.next_scene('victory') # goes to @scene_map, finds 'finished', and sets it to last_scene

    while current_scene != last_scene
      next_scene_name = current_scene.enter() # enter the current scene, and store it as next_scene_name
      current_scene = @scene_map.next_scene(next_scene_name) # perform the next_scene method (with parameter next_scene_name) on @scene_map, and store the result in current_scene 
    end

    current_scene.enter() # perform the .enter() method on current_scene
  end

end

class Captured < Scene

  def enter()
    puts "You and your companions are on a"
    puts "journey to kill the dragon Smaug"
    puts "and take back your homeland, The Lonely Mountain."
    puts "You're passing through the mountains"
    puts "And are captured by goblins!"
    puts "You're defenseless, and the goblins"
    puts "have swords and bows and axes."
  end
  
  def goblin_plan 
    print "Do you try to FIGHT, RUN, or TALK A WAY OUT OF IT? > "

    plan = $stdin.gets.chomp.downcase

    if plan == "fight"
      puts "A defenseless idiot, you try to fight off the goblins. You die. Big surprise."
      return 'death'
    elsif plan == "run"
      puts "You decide to run, but your short little legs don't get you far enough. You die. Big surprise."
      return 'death'
    elsif plan == "talk a way out of it"
      puts "You start chatting away with the goblin king, calling him all sorts of awful things, like 'smelly' and 'a goblin'. You know this isn't gonna work, but suddenly: poof! The wizard, Gandalf the Gray, appears! He kills the goblin king, totally fudging any hopes of negotiation. With a wizard at your back, you high tail it outta there!"
      return 'riddles'
    else
      puts "Sorry, that's a terrible plan. Pick one of the 3 options I gave you."
      return 'captured'
    end
  end

end

class Riddles < Scene

  def enter()
    puts "You've lost the goblins, but you've also gotten separated from your comrades! Instead of fresh air, you've found a damp and gloomy cave. You're stumbling around in the dark when - huh! - your spidey-sense feet feel a round, metal object beneath them. You reach down to pick up the ring, and hear a hissing behind you, followed by the words 'What is it preciousssss? Is it juicy? Is it scrumptiousssssss?'"
    puts "The half-ling creature creeps closer on all fours, asking again 'What is it?'"
    puts "You reply 'I am Bilbo Baggins, a hobbit of the Shire, and I'm afraid I've become quite lost. Will you help me find my way out?"
    puts "The creature, Gollum, replies 'Maybe we will, maybe we won't. Let'sssss play a game. If we loses, we helps it find its way out. If we winses..we EATS it! Will it play?', he asks you."
    puts "You reply, with no sense at all, 'Yes, we'll play'. What game are we playing?"
    puts "Gollum replies, 'Riddles! Riddlesesssss it is!'"
    puts "And so the game of riddles begins."
    puts "If you fail to answer, Gollum wins."
    puts "If you answer 3 in a row correctly, you win."
    
    puts "Gollum offers the first riddle:"

    riddle_count == 1
  end

  def riddles
    if riddle_count == 1
      puts "   What has roots as nobody sees,"
      puts "   Is taller than trees,"
      puts "   Up, up, up it goes"
      puts "   And yet, never grows."
      correct_answer = "mountain"
    elsif riddle_count == 2
      puts "Voiceless it cries,"
      puts "Wingless flutters,"
      puts "Toothless bites,"
      puts "Mouthless mutters."
      correct_answer = "wind"
    elsif riddle_count == 3
      puts "It cannot be seen, cannot be felt,"
      puts "Cannot be heard, cannot be smelt."
      puts "It lies behind stars and under hills,"
      puts "And empty holes it fills."
      puts "It comes first and follows after,"
      puts "Ends life, kills laughter."
      correct_answer = "darkness"
    else
      puts "You correctly solved 3 riddles in a row!"
      return 'escape'  
    end
  end

  def answer_riddle
    print "What is the answer? > "
    your_answer = $stdin.gets.chomp.downcase
    if your_answer.include? "#{correct_answer}"
      puts "You got it! The answer is '#{correct_answer}'!"
      riddle_count += 1
      riddles
    else
      puts "'#{your_answer} is...not the answer. You lose. Gollum eats you, and so you die."
      puts 'death'
    end
  end
  
end

class Escape < Scene

  def enter()
    puts "But Gollum won't accept it."
    puts "He's been too long without food."
    puts "And you're far too portly to go uneaten."
    puts "He crawls toward you menacingly."
    puts "You have one a moment to decide what to do."
  end

  def escape_plan 
    print "Do you RUN, FIGHT, or...PUT ON THAT INCONSPICUOUS RING YOU FOUND?"

    action = $stdin.gets.chomp.downcase

    if action == "run"
      puts "You're a fat hobbit, and you're not very quick. Gollum catches and eats you. You die."
      return 'death'
    elsif action == "FIGHT"
      puts "You're a fat hobbit, and Gollum is a lean, mean, precious machine. Gollum kills you and eats you."
      return 'death'
    elsif action == "put on that inconspicuous ring you found"
      puts "You slip the ring onto your finger, and Gollum suddenly reels back interror. You examine your hand, and to your terror, your hand is gone -- along with the rest of your body! You've completely vanished! Being a sensible little hobbit, you scidaddle out of Gollum's cave. Striking out on the first path you find, you manage to work your way out of the mountain and into the sunshine, followed only by your shadow."
      return 'victory'
    else
      puts "Sorry, but that's a terrible shot. Let's try again. Pick an action."
      return 'escape'
    end
  end

end

class Death < Scene

  def enter()
    puts "You died. Nice job. Long live Smaug!"
  end

end

class Victory < Scene
  def enter()
    puts "You win! Congratulations!"
  end
end

class Map
  @@scenes = {
    'captured' => Captured.new(), # creates a new instance of the Captured class, and stores it in 'captured'
    'riddles' => Riddles.new(), # /
    'escape' => Escape.new(), # /
    'death' => Death.new()
  }

  def initialize(start_scene)
    @start_scene = start_scene # creates the start_scene object, and stores it in @start_scene
  end

  def next_scene(scene_name)
    val = @@scenes[scene_name] # takes a scene_name parameter, finds it in the @@scenes hash, and stores the result in the val variable
    return val
  end

  def opening_scene()
    return next_scene(@start_scene) # takes the @start_scene parameter into the next_scene method, runs next_scene, and returns the result
  end
end

a_map = Map.new('captured')
a_game = Engine.new(a_map)
a_game.play()
