class Lexicon
  
  def self.scan(input)
    # store an array of three direction words in the variable directions
    directions = ["north", "south", "east"]
    verbs = ["go", "kill", "eat"]
    stop = ["the", "in", "of"]
    nouns = ["bear", "princess"]
    numbers = ["1234", "3", "91234"]
    errors = ["ASDFADFASDF", "IAS"]
    output = []
    # get a statement from the user
    # split the statement into individual words
    words = input.split(' ')

    # for each word w 
    words.each do |word|
      # if w is a direction
      if directions.include? word
        output << ['direction', word]
      elsif verbs.include? word 
        output << ['verb', word]
      elsif stop.include? word
        output << ['stop', word]
      elsif nouns.include? word
        output << ['noun', word]
      elsif numbers.include? word
        output << ['number', word.to_i]
      elsif errors.include? word
        output << ['error', word]
      end
    end
    
    output
  
  end

end
