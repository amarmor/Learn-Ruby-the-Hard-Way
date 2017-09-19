require 'ex48/parser.rb'
require "test/unit"

class TestParser < Test::Unit::TestCase
  def test_peek()
    assert_equal('object', Sentence.peek([['object', 'north']]))
  end

  def test_match()
    assert_equal(['object', 'north'], Sentence.match([['object', 'north']], 'object'))
  end

  def test_skip
    assert_equal(['stop', 'the'], Sentence.skip([['stop', 'the'], ['object', 'north']], 'stop'))
  end
end
