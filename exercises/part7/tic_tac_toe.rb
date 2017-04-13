=begin
Tic-Tac-Toe

Let's write a Tic-Tac-Toe game! Read the entire instructions before getting
started.

* In your `Board` class, you should have a grid instance variable to keep track
  of the board tiles. You should also have the following methods:
  - `place_mark`, which takes a position such as `[0, 0]` and a mark such as :X
    as arguments. It should throw an error if the position isn't empty.
  - `empty?`, which takes a position as an argument
  - `winner`, which should return a mark
  - `over?`, which should return true or false
  - If you want to be a little fancy, read the attached `bracket-methods`
    reading.

* In your player classes, have an instance variable `mark` that the game will
  set on initialize.

* In your `HumanPlayer` class,
  - `display` should print the board out to the console
  - `get_move` should allow the player to enter a move of the form '0, 0', and
    return it as a position of the form `[0, 0]`

* In your `ComputerPlayer` class,
  - `display` should store the board it's passed as an instance variable, so
    that `get_move` has access to it
  - `get_move` should return a winning move if one is available, and otherwise
    move randomly.

* In your `Game` class, set the marks of the players you are passed. Include
  the following methods:
  - `current_player`
  - `switch_players!`
  - `play_turn`, which handles the logic for a single turn
  - `play`, which calls `play_turn` each time through a loop until the game is
    over

Pro tips:
  * Both `HumanPlayer` and `ComputerPlayer` should have the same API; they
    should have the same set of public methods. This means they should be
    interchangeable.
  * Your `Game` class should be passed two player objects on
    instantiation; because both player classes have the same API, the
    game should not know nor care what kind of players it is given.

Note that the specs are written to help you build the game in a very specific
way; there are other implementations that would also result in a playable game
but not pass the specs. We choose to sacrifice flexibility of design in order
to offer you more support implementing this particular solution. Don't worry,
you'll have plenty of opportunities to make larger-scale design decisions going
forward!

=end

class Board
end

class ComputerPlayer
end

class HumanPlayer
end

class Game
end
