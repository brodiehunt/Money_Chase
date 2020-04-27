require 'ruby2d'
require 'test/unit'
require_relative './trump.rb'
require_relative './enemy.rb'


class TrumpTest < Test::Unit::TestCase

  def test_trump_initial_direction
    trump = Trump.new
    assert_equal('d', trump.direction)
  end
end

class TrumpTest < Test::Unit::TestCase
  def test_increase_length_boolean
    trump = Trump.new 
    assert_false(trump.increase_size)
  end
end

class EnemyTest < Test::Unit::TestCase
  def test_locations_is_empty_array
    enemy = Enemy.new
    assert_equal([], enemy.locations)
  end
end

