# This class is used to create the enemy object.
# Contains methods to increase enemies, draw them to the window
# and check collisions.
class Enemy
  attr_reader :enemy_collide, :locations, :coin_allowed
  def initialize
    @locations = []
    @enemy_collide = false
    @coin_allowed = true
  end

  def add_enemy
    @locations.push([rand(WIDTH), rand(HEIGHT)])
  end

  def draw
    @locations.each do |index|
      Square.new(x: index[0] * GRID_SIZE, y: index[1] * GRID_SIZE,
                 size: GRID_SIZE, color: 'red')
    end
  end

  def coin_spawn_allowed(coin_coordinates)
    @coin_allowed = true
    @locations.each do |index|
      if index == coin_coordinates
        @coin_allowed = false
        break
      end
    end
  end

  def trump_collide?(head_snake)
    @locations.each do |index|
      if index == head_snake
        @enemy_collide = true
        break
      end
    end
  end
end
