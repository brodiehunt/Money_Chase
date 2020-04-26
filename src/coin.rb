# This class is responsible for the coin object.
class Coin
  def initialize
    @x = rand(WIDTH)
    @y = rand(HEIGHT)
  end

  def draw
    Sprite.new('./../media/coin.png', clip_width: 40, time: 300, loop: true,
                                      x: @x * GRID_SIZE, y: @y * GRID_SIZE)
  end

  def trump_collect?(collision_x, collision_y)
    @x == collision_x && @y == collision_y
  end

  def change_location
    @x = rand(WIDTH)
    @y = rand(HEIGHT)
  end
end
