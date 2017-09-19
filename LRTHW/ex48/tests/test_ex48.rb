require 'ex48/lexicon.rb'
require "test/unit"

class TestLexicon < Test::Unit::TestCase
  def test_directions()
    assert_equal([['direction', 'north']], Lexicon.scan("north"))

    result = Lexicon.scan("north south east")
    assert_equal([['direction', 'north'], ['direction', 'south'], ['direction', 'east']], result)
  end

  def test_verbs()
    assert_equal([['verb', 'go']], Lexicon.scan("go"))
    
    result = Lexicon.scan("go kill eat")
    assert_equal([['verb', 'go'],
      ['verb', 'kill'],
      ['verb', 'eat']], result)
  end

  def test_stops()
    assert_equal([['stop', 'the']], Lexicon.scan("the"))
    result = Lexicon.scan("the in of")
    assert_equal([['stop', 'the'],
                  ['stop', 'in'],
                  ['stop', 'of']], result)
  end

  def test_nouns()
    assert_equal(Lexicon.scan("bear"), [['noun', 'bear']])
    result = Lexicon.scan("bear princess")
    assert_equal(result, [['noun', 'bear'],
                          ['noun', 'princess']])
  end

  def test_errors()
    assert_equal(Lexicon.scan("ASDFADFASDF"), [['error', 'ASDFADFASDF']])
    result = Lexicon.scan("bear IAS princess")
    assert_equal(result, [['noun', 'bear'],
                          ['error', 'IAS'],
                          ['noun', 'princess']])
  end
end



