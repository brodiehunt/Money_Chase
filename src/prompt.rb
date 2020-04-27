# This class inherits from tty-prompt gem class Prompt and has
# additional functionality.
require 'tty-prompt'
class Display < TTY::Prompt
  attr_accessor :username
  def initialize
    super
    @username = 'user'
  end

  def options_array(username)
    if username == 'user'
      [{ name: 'Play', disabled: '(Create username first)' }, 'Create Username',
       'Quit']
    else
      ['Play', { name: 'Create Username', disabled: '(Username already accepted)' },
       'Change username', 'How to Play', 'Quit']
    end
  end

  def menu_input(prompt_input)
    prompt_input
  end
end
