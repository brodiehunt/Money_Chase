class Trump
  def initialize 
    @direction = 'd'
    @location = [[0, 10], [1, 10], [2, 10]]
    @increase_size = false
  end

  def draw
    @location.each do |index|
      Sprite.new('./../media/trump_move.png', clip_width: 40, time: 20, loop: true, x: index[0] * GRID_SIZE, y: index[1] * GRID_SIZE)
    end
  end

  def move_trump
    @location.shift unless @increase_size
    if @direction == 'd'
      @location.push([front_of_trump[0] + 1, front_of_trump[1]])
    elsif @direction == 'a'
      @location.push([front_of_trump[0] -1, front_of_trump[1]])
    elsif @direction == 'w'
      @location.push([front_of_trump[0], front_of_trump[1] -1])
    elsif @direction == 's'
      @location.push([front_of_trump[0], front_of_trump[1] +1])
    end
    @increase_size = false
  end

  def border_float_x(collision_x)
    (collision_x * GRID_SIZE) < 400 
  end

  def border_float_y(collision_y)
    (collision_y * GRID_SIZE) < 300
  end




  def check_borders
    if @direction == 'w' && collision_y.zero?
      if border_float_x(collision_x)
        @direction = 'd'
      else 
        @direction = 'a'
      end
    elsif @direction == 's' && collision_y == HEIGHT - 1
      if border_float_x(collision_x)
        @direction = 'd'
      else 
        @direction = 'a'
      end
    elsif @direction == 'a' && collision_x.zero?
      if border_float_y(collision_y)
        @direction = 's'
      else 
        @direction = 'w'
      end
    elsif @direction == 'd' && collision_x == WIDTH - 1
      if border_float_y(collision_y)
        @direction = 's'
      else 
        @direction = 'w'
      end
    end
  end

  def direction=(new)
    @direction = new
  end

  def direction
    @direction
  end

  def increase_size
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