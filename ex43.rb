class Scene
  def enter()
    puts "This scene is not yet configured. Subclass it and implement enter()."
    exit(1)
  end
end

class Engine
  
  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('finished')

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)
    end
  
    current_scene.enter() 
  end
end

class Death < Scene

  def enter()
    puts "Whoops! Now you're dead."
  end
end

class CentralCorridor < Scene

  def enter()
    puts "It looks like there's a Gothon standing in front of you. What are you gonna do?"

    print "[tell a joke, fight, or run]> "

    action = $stdin.gets.chomp

    if action == "fight"
      puts "The Gothon fights back."
      'death'
    elsif action == "run"
      puts "The Goton chases you."
      'death'
    elsif action == "tell a joke"
      puts "The Goton's face breaks into a grin, and suddenly, the Gothon's explodes! Looks like humor kills Gothons. Lucky you."
      'laser_weapon_armory'
    else
      puts "DOES NOT COMPUTE!"
      'central_corridor'
    end
  end
end

class LaserWeaponArmory < Scene

  def enter()
    puts "You've entered the Laser Weapon Armory, and lo and behold, that's a neutron bomb! Let's get it. Then we can blow this tin tan to smithereens and -- wa-oosh! -- zip away in an escape pod. But it looks like the bomb has a 10-guess keypad. Can you get the code right?"
    
    tries_left = 10
    attempt = nil
    code = nil
    
    while tries_left != 0 && attempt != code
      print "Enter a 3-digit code: > "
      
      attempt = $stdin.gets.chomp
      code = "123"

      if attempt == code 
        puts "Congratulations! You unlocked the bomb. Now let's move this sucker to the Bridge."
        'the_bridge'
      elsif tries_left > 0
        tries_left -= 1
        puts "Wrong code! You have #{tries_left} tries left."
        'laser_weapon_armory'
      else
        'death'
      end
    end
    
    if tries_left == 0
      'death'
    end

  end

end

class TheBridge < Scene

  def enter()
    puts "You made it to the Bridge! But oh uh..."
    central_corridor
    if action == "tell a joke"
      "Nice job! You killed the Gothon. Now, let's place the bomb and get to one of those escape pods! (You place the bomb and start running)"
    end
  end
end

class EscapePod < Scene

  def enter()
    puts "Well, we made it to the escape pods! There's no time to make sure they're all working, so you'll just have to rely on your killer instinct and pick one."
    goodPod = 3

    print "Which pod will you pick? > "

    podChoice = $stdin.gets.chomp

    if goodPod = podChoice
      puts "Yahoo! We made it!"
      return finished
    else
      puts "Well, guess that's that. Kabloomers! Destruction!"
      death
    end
  end
end

class Finished < Scene
  def enter()
    puts "You won! Good job."
  end
end

class Map

    @@scenes = {
      'central_corridor' => CentralCorridor.new(),
      'laser_weapon_armory' => LaserWeaponArmory.new(),
      'the_bridge' => TheBridge.new(),
      'escape_pod' => EscapePod.new(),
      'death' => Death.new(),
      'finished' => Finished.new()
    }

  def initialize(start_scene)
    @start_scene = start_scene
  end

  def next_scene(scene_name)
    val = @@scenes[scene_name]
    return val
  end

  def opening_scene()
    return next_scene(@start_scene)
  end
end


a_map = Map.new('central_corridor')
a_game = Engine.new(a_map)
a_game.play()
