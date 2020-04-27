# This class is responsible for snakes function, movement, interaction.
class Trump
  attr_reader :increase_size
  def initialize
    @direction = 'd'
    @location = [[0, 10], [1, 10], [2, 10]]
    @increase_size = false
  end

  def draw
    @location.each do |index|
      Sprite.new('./../docs/trump_move.png', clip_width: 40, time: 20, loop: true,
                                              x: index[0] * GRID_SIZE, y: index[1] * GRID_SIZE)
    end
  end

  def move_trump
    @location.shift unless @increase_size
    if @direction == 'd'
      @location.push([front_of_trump[0] + 1, front_of_trump[1]])
    elsif @direction == 'a'
      @location.push([front_of_trump[0] - 1, front_of_trump[1]])
    elsif @direction == 'w'
      @location.push([front_of_trump[0], front_of_trump[1] - 1])
    elsif @direction == 's'
      @location.push([front_of_trump[0], front_of_trump[1] + 1])
    end
    @increase_size = false
  end

  def collision_top_bottom(collision_x)
    (collision_x * GRID_SIZE) < 400
  end

  def collision_left_right(collision_y)
    (collision_y * GRID_SIZE) < 300
  end

  def top_bottom_dir_change
    if collision_top_bottom(collision_x)
      @direction = 'd'
    else
      @direction = 'a'
    end
  end

  def left_right_dir_change
    if collision_left_right(collision_y)
      @direction = 's'
    else
      @direction = 'w'
    end
  end

  def check_borders
    if @direction == 'w' && collision_y.zero?
      top_bottom_dir_change
    elsif @direction == 's' && collision_y == HEIGHT - 1
      top_bottom_dir_change
    elsif @direction == 'a' && collision_x.zero?
      left_right_dir_change
    elsif @direction == 'd' && collision_x == WIDTH - 1
      left_right_dir_change
    end
  end

  def direction=(new)
    @direction = new
  end

  def direction
    @direction
  end

  def increase_size_flip
    @increase_size = true
  end

  def front_of_trump
    @location[@location.length - 1]
  end

  def collision_x
    front_of_trump[0]
  end

  def collision_y
    front_of_trump[1]
  end

  def trump_length
    trump = @location.dup
    trump.delete(front_of_trump)
    trump.length
  end

  def hit_itself
    @location.length == trump_length + 2
  end
end
