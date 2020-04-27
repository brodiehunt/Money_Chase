# This class is responsible for the coin object.
class Coin
  # attr_reader :x, :y,
  def initialize
    @x = rand(1...WIDTH)
    @y = rand(1...HEIGHT)
  end

  def coin_coordinates
    [@x, @y]
  end

  def draw
    Sprite.new('./../docs/coin.png', clip_width: 40, time: 300, loop: true,
                                      x: @x * GRID_SIZE, y: @y * GRID_SIZE)
  end

  def trump_collect?(collision_x, collision_y)
    @x == collision_x && @y == collision_y
  end

  def change_location
    @x = rand(1...WIDTH)
    @y = rand(1...HEIGHT)
  end
end
