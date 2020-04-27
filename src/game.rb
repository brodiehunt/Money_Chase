# This class is responsible for increasing the game score
# and displaying text to the screen depending on the game stage
class Game
  attr_accessor :game_stage, :score
  def initialize
    @score = 0
    @game_stage = 'start'
  end

  def draw
    if @game_stage == 'start'
      text_start
    elsif @game_stage == 'play'
      text_play
    elsif @game_stage == 'rescue'
      text_rescue
    elsif @game_stage == 'pause'
      text_end
    end
  end

  def text_start
    Image.new('./../docs/trump_background.png', x: 110, y: 50,
                                                 width: 600, height: 400)
    Text.new("WELCOME! PRESS 'T' TO QUIT, 'R' TO RESTART", x: 50, y: 450,
                                                           size: 30, color: 'red')
    Text.new('OR PRESS ANY OTHER KEY TO START PLAYING', x: 50, y: 490,
                                                        size: 30, color: 'red')
    Text.new("'W'=UP, 'S'=DOWN, 'A'=LEFT, 'D'=RIGHT", x: 20, y: 520,
                                                      size: 40, color: 'blue')
  end

  def text_play
    Text.new("Score: #{@score}", x: 10, y: 560, color: 'white', size: 30)
  end

  def text_rescue
    Text.new("Score: #{@score}", x: 20, y: 560, color: 'white', size: 30)
    Text.new('Press a valid key', x: 200, y: 560, color: 'red', size: 30)
  end

  def text_end
    Image.new('./../docs/trump_pepe.png', x: 110, y: 50, width: 600,
                                           height: 400)
    Text.new("YOU DIED!!!! YOUR SCORE IS #{@score}", x: 80, y: 450,
                                                     color: 'red', size: 40)
    Text.new("PRESS 'R' TO RESTART, 'T' TO QUIT", x: 20, y: 500,
                                                  color: 'blue', size: 45)
  end

  def score_increase
    @score += 10
  end
end
