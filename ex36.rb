def story_begins
  puts <<-END
  "Your name is Harry Potter, and you are a wizard in training.
  Eleven years ago, the dark lord Voldemort killed your parents.
  He also tried to kill you, but he did not succeed.
  His curse rebounded.
  You are the boy who lived.
  
  Now, eleven years later, you are studying magic at Hogwarts School of Witchcraft and Wizardry.
  You and your two best friends, Ron Weasley and Hermione Granger, have discovered that a Hogwarts professor is trying to help Voldemort COME BACK. 
  This professor is none other than the greasy-headed black-eyed Severus Snape.
  Snape is going to steal a Sorcerer's Stone, which is hidden and under protection at Hogwarts.
  
  You, Ron, and Hermione have found out where the Stone is.
  You've made it past a three-headed dog, caught a flying key, and played your way across a life-size game of Wizards' Chess.
  But Ron got hurt.
  And now it's up to you and Hermione to save Ron and save the Stone.
  
  You've entered a room with a table (surprising, when usually the doorknob does the trick).
  On the table, there are seven bottles and a piece of paper.
  You and Hermione walk over to the table and pick up the paper.
  As you do so, a fire springs up behind you in the doorway.
  It isn’t ordinary fire; it is purple.
  At the same instant, black flames shoot up in the doorway leading onwards.
  You are trapped.
  You glance down at the piece of paper, clutched in your now-trembling hand."
  END
end

def riddle  
  puts "Type 'read' to read the piece of paper: "
  print "> "
  read = $stdin.gets.chomp.downcase
  while read != "read"
    puts "Whoops! That wasn't 'read'. Try it again. Just type 'read'!"
  end
    puts <<-END
    "Danger lies before you, while safety lies behind,
    Two of us will help you, whichever you would find,
    One among us seven will let you move ahead,
    Another will transport the drinker back instead,
    Two among our number hold only nettle wine,
    Three of us are killers, waiting hidden in line.
    Choose, unless you wish to stay here for evermore,
    To help you in your choice, we give you these clues four:
    First, however slyly the poison tries to hide
    You will always find some on nettle wine’s left side;
    Second, different are those who stand at either end,
    But if you would move onwards, neither is your friend;
    Third, as you see clearly, all are different size,
    Neither dwarf nor giant holds death in their insides;
    Fourth, the second left and the second on the right
    Are twins once you taste them, though different at first sight."
    END
end

def view_bottles
  puts "Type 'view' to view bottles: "
  print "> "
  view = $stdin.gets.chomp
  while view != "view"
    puts "Whoops, that wasn't 'view'! Try again. Just type 'view'."
    print "> "
    view = $stdin.gets.chomp
  end
  puts "You glance again at the table. This time, you notice that there are 7 bottles."
  bottles = ["1", "2", "3", "4", "5", "6", "7"]
  puts bottles
end

def prompt
  puts "Would you like to VIEW THE POTIONS, TAKE A CLOSER LOOK, MAKE A NOTE, or DRINK A POTION? "
  print "> "
  choice = $stdin.gets.chomp.downcase
  if choice == "view the bottles"
    view_bottles
  elsif choice == "take a closer look"
    take_look
  elsif choice == "make a note"
    make_note
  elsif choice == "drink a bottle"
    drink_bottle
  else
    puts "That's not an option!"
  end
end

def take_look
  puts "Looks like the bottle 3 is pretty small and potion 6 is pretty big!"
  prompt
end

def make_note
  puts "Select a bottle: "
  print "> "
  bottleNum = $stdin.gets.chomp
  puts "Bottle ##{bottleNum} selected. Enter your note: "
  print "> "
  bottleNote = $stdin.gets.chomp
  bottleToMod = bottleNum.to_i - 1
  bottles[bottles.index(bottleToMod)] = [potionNum + "[" + potionNote + "]"]
  puts "Entered note '#{bottleNote}' for potion ##{potionNum}"
  prompt
end

def sel_oneDrinker
  puts "Should HERMIONE drink bottle #{oneBottle}, or should YOU?"
  print "> "
  oneDrinker = $stdin.gets.chomp.upcase
  currentDrinker = oneDrinker
  drink_bottle
end

def sel_oneBottle
  puts "Two bottles will help you. Which is the first bottle? "
  print "> "
  oneBottle = $stdin.gets.chomp
  currentBottle = oneBottle
end

def drink_bottle
  
  puts "OK, #{currentDrinker} is drinking #{currentBottle}. And..."
  
  while currentBottle = "2" || "6"
    puts "Wine! #{currentDrinker}, drunken at the bottom of the depression well, caved to hedonism and left amity to rot. Well done, Gryffindor; well done, Gryffindor. Why don't we try that again? Which bottle will #{currentDrinker} drink? "
    print "> "
    currentBottle = $stdin.gets.chomp  
    drinker_drunk
  end

  if currentBottle == "7"
    puts "Congratulations! #{currentDrinker} can go help Ron. [#{currentDrinker} goes back to help Ron.]"
  elsif currentBottle == "3"
    puts "Congratulations! #{currentDrinker} can go save the Stone! [#{currentDrinker} goes ahead to save the stone.]"
  else
    puts "Recklessness, and poor analytical skills. You must be a Gryffindor. That was poison, you idiot. So I guess that's that for #{currentDrinker}. [#{currentDrinker} = dead]."
  end  
  
  drinker_status
  
  if currentDrinker = oneDrinker
    oneDrinkerComplete = true
  else
    twoDrinkerComplete = true
  end
  
  prompt

end

def drinker_drunk
  if currentDrinker == oneDrinker
    oneDrinkerDrunk == true
  else
    twoDrinkerDrunk == true
  end
end

def drinker_status
  if currentBottle == "7"
    if currentDrinker == oneDrinker
      oneDrinkerStatus = back
    else
      twoDrinkerStatus = back
    end
  elsif currentBottle == "3"
    if currentDrinker == oneDrinker
      oneDrinkerStatus = ahead
    else
      twoDrinkerStatus = ahead
    end
  else
    if currentDrinker == oneDrinker
      oneDrinkerStatus = dead
    else
      twoDrinkerStatus = dead
    end
  end
end

def sel_twoBottle
  puts "So that's the first bottle down. Which is the second potion? "
  print "> "
  twoBottle = $stdin.get.chomp
  currentBottle = twoBottle
end

def sel_twoDrinker
  if oneDrinker_status = complete   
    if oneDrinker == "HERMIONE"
      currentDrinker = "YOU"
    else
      currentDrinker = "HERMIONE"
    end
  else
    currentDrinker = oneDrinker
  end
  drink_bottle
end

def fin
  if (oneDrinkerStatus || twoDrinkerStatus == dead) && (oneDrinkerStatus || twoDrinkerStatus == behind)
    if oneDrinkerStatus == dead
      puts "Well, #{oneDrinker} died, but #{twoDrinker} saved Ron, so that's sort of a success."
    else
      puts "Well, #{twoDrinker} died, but #{oneDrinker} saved Ron, so that's sort of a success."
    end
  elsif (oneDrinkerStatus || twoDrinkerStatus == dead) && (oneDrinkerStatus || twoDrinkerStatus == ahead)
    if oneDrinkerStatus == dead
      puts "Well, #{oneDrinker} died, but #{twoDrinker} saved the Stone, so that's sort of a success."
    else
      puts "Well, #{twoDrinker} died, but #{oneDrinker} saved the Stone, so that's sort of a success." 
    end
  else
    if oneDrinkerStatus == ahead
      puts "#{oneDrinker} saved the Stone, and #{twoDrinker} saved Ron! A massive success!"
      if oneDrinkerDrunk || twoDrinkerDrunk == true
        puts "I'd say 'Let's drink to that,' but it seems you already have!"
      end
    else
      puts "#{twoDrinker} saved the Stone, and #{oneDrinker} saved Ron! A massive success!" 
      if oneDrinkerDrunk || twoDrinkerDrunk == true
        puts "I'd say 'Let's drink to that,' but it seems you already have!"
      end
    end 
  end
end

story_begins
riddle
view_bottles
prompt
sel_oneDrinker
sel_oneBottle
drink_bottle
sel_twoBottle
sel_twoDrinker
fin
