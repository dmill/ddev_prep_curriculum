ONES = {
  0 => "zero",
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine"
}

TENS = {
  20 => "twenty",
  30 => "thirty",
  40 => "forty",
  50 => "fifty",
  60 => "sixty",
  70 => "seventy",
  80 => "eighty",
  90 => "ninety"
}

TEENS = {
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen"
}

MAGNITUDES = {
  100 => "hundred",
  1000 => "thousand",
  1_000_000 => "million",
  1_000_000_000 => "billion",
  1_000_000_000_000 => "trillion"
}

class Fixnum
  def in_words
    if (self < 10)
      ONES[self]
    elsif (self < 20)
      TEENS[self]
    elsif (self < 100)
      tens_word = TENS[(self / 10) * 10]
      if (self % 10) != 0
        tens_word + " " + (self % 10).in_words
      else
        tens_word
      end
    else
      magnitude = find_magnitude
      magnitude_words =
        (self / magnitude).in_words + " " + MAGNITUDES[magnitude]
      if (self % magnitude) != 0
        magnitude_words + " " + (self % magnitude).in_words
      else
        magnitude_words
      end
    end
  end

  def find_magnitude
    MAGNITUDES.keys.take_while { |magnitude| magnitude <= self }.last
  end
end

class RPNCalculator
  OPERATORS = [:+, :-, :*, :/]

  def initialize
    @stack = []
  end

  def divide
    perform_op(:/)
  end

  def evaluate(string)
    tokens(string).each do |token|
      case token
      when Integer
        push(token)
      when Symbol
        perform_op(token)
      end
    end

    value
  end

  def minus
    perform_op(:-)
  end

  def plus
    perform_op(:+)
  end

  def push(num)
    @stack << num
  end

  def times
    perform_op(:*)
  end

  def tokens(string)
    chars = string.split(" ")
    chars.map { |char| operator?(char) ? char.to_sym : Integer(char) }
  end

  def value
    @stack.last
  end

  private
  def operator?(char)
    OPERATORS.include?(char.to_sym)
  end

  def perform_op(op_sym)
    raise "calculator is empty" unless @stack.count >= 2

    right_operand = @stack.pop
    left_operand = @stack.pop

    case op_sym
    when :+
      @stack << left_operand + right_operand
    when :-
      @stack << left_operand - right_operand
    when :*
      @stack << left_operand * right_operand
    when :/
      # `Fixnum#fdiv` is like `/` but makes sure not to round down.
      @stack << left_operand.fdiv(right_operand)
    else
      @stack << left_op << right_op
      raise ArgumentError.new("No operation #{op_sym}")
    end

    self
  end
end

class MyHashSet
  attr_reader :store

  def initialize
    @store = {}
  end

  def insert(el)
    store[el] = true
  end

  def include?(el)
    store.has_key?(el)
  end

  def delete(el)
    return false unless self.include?(el)
    store.delete(el)
    true
  end

  def to_a
    store.keys
  end

  def union(set2)
    new_set = self.class.new
    self.to_a.each { |el| new_set.insert(el) }
    set2.to_a.each { |el| new_set.insert(el) }
    new_set
  end

  def intersect(set2)
    new_set = self.class.new
    self.to_a.each do |el|
      new_set.insert(el) if set2.include?(el)
    end
    new_set
  end

  def minus(set2)
    new_set = self.class.new
    self.to_a.each do |el|
      new_set.insert(el) unless set2.include?(el)
    end
    new_set
  end
end

class Course
  attr_reader :department, :name, :credits, :time_block, :days, :students

  def initialize(name, department, credits, days=nil, time_block=nil)
    @name, @department, @credits, @days, @time_block =
      name, department, credits, days, time_block
    @students = []
  end

  def conflicts_with?(course2)
    return false if self.time_block != course2.time_block

    days.any? do |day|
      course2.days.include?(day)
    end
  end

  def add_student(student)
    student.enroll(self)
  end
end

class Student
  attr_reader :courses, :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name, @last_name = first_name.capitalize, last_name.capitalize
    @courses = []
  end

  def name
    "#{first_name} #{last_name}"
  end

  def enroll(course)
    # ignore re-adding a course
    return if courses.include?(course)
    raise "course would cause conflict!" if has_conflict?(course)

    self.courses << course
    course.students << self
  end

  def course_load
    load = Hash.new(0)
    self.courses.each do |course|
      load[course.department] += course.credits
    end
    load
  end

  def has_conflict?(new_course)
    self.courses.any? do |enrolled_course|
      new_course.conflicts_with?(enrolled_course)
    end
  end
end

class TowersOfHanoi
  attr_reader :towers

  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def play
    display

    until won?
      puts 'What tower do you want to move from?'
      from_tower = gets.to_i

      puts 'What tower do you want to move to?'
      to_tower = gets.to_i

      if valid_move?(from_tower, to_tower)
        move(from_tower, to_tower)
        display
      else
        display
        puts "Invalid move. Try again."
      end
    end

    puts 'You win!'
  end

  def won?
    @towers[0].empty? && @towers[1..2].any?(&:empty?)
  end

  def valid_move?(from_tower, to_tower)
    return false unless [from_tower, to_tower].all? { |i| i.between?(0, 2) }

    !@towers[from_tower].empty? && (
      @towers[to_tower].empty? ||
      @towers[to_tower].last > @towers[from_tower].last
    )
  end

  def move(from_tower, to_tower)
    @towers[to_tower] << @towers[from_tower].pop
  end

  def render
    'Tower 0:  ' + @towers[0].join('  ') + "\n" +
    'Tower 1:  ' + @towers[1].join('  ') + "\n" +
    'Tower 2:  ' + @towers[2].join('  ') + "\n"
  end

  def display
    # this moves everything up in the console so that whatever we print
    # afterwards appears at the top
    system('clear')
    puts render
  end
end

if $PROGRAM_NAME == __FILE__
  TowersOfHanoi.new().play
end

class Board
  attr_reader :grid, :marks

  def self.blank_grid
    Array.new(3) { Array.new(3) }
  end

  def initialize(grid = Board.blank_grid)
    @grid = grid
    @marks = [:X, :O]
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def over?
    grid.flatten.none? { |pos| pos.nil? } || winner
  end

  def winner
    (grid + cols + diagonals).each do |triple|
      return :X if triple == [:X, :X, :X]
      return :O if triple == [:O, :O, :O]
    end

    nil
  end

  def cols
    cols = [[], [], []]
    grid.each do |row|
      row.each_with_index do |mark, col_idx|
        cols[col_idx] << mark
      end
    end

    cols
  end

  def diagonals
    down_diag = [[0, 0], [1, 1], [2, 2]]
    up_diag = [[0, 2], [1, 1], [2, 0]]

    [down_diag, up_diag].map do |diag|
      # Note the `row, col` inside the block; this unpacks, or
      # "destructures" the argument. Read more here:
      # http://tony.pitluga.com/2011/08/08/destructuring-with-ruby.html
      diag.map { |row, col| grid[row][col] }
    end
  end

  def empty?(pos)
    self[pos].nil?
  end

  def place_mark(pos, mark)
    self[pos] = mark
  end
end

class ComputerPlayer
  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def get_move
    moves = []
    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        moves << pos if board[pos].nil?
      end
    end

    moves.each do |move|
      return move if wins?(move)
    end

    moves.sample
  end

  def wins?(move)
    board[move] = mark
    if board.winner == mark
      board[move] = nil
      true
    else
      board[move] = nil
      false
    end
  end

  def display(board)
    @board = board
  end
end

class HumanPlayer
  attr_reader :name
  attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def get_move
    puts "Where would you like to move? (row, col)"
    gets.chomp.split(",").map(&:to_i)
  end

  def display(board)
    row0 = "0 |"
    (0..2).each do |col|
      row0 << (board.empty?([0, col]) ? "   |" : " " + board[[0, col]].to_s + " |")
    end
    row1 = "1 |"
    (0..2).each do |col|
      row1 << (board.empty?([1, col]) ? "   |" : " " + board[[1, col]].to_s + " |")
    end
    row2 = "2 |"
    (0..2).each do |col|
      row2 << (board.empty?([2, col]) ? "   |" : " " + board[[2, col]].to_s + " |")
    end

    puts "    0   1   2  "
    puts "  |-----------|"
    puts row0
    puts "  |-----------|"
    puts row1
    puts "  |-----------|"
    puts row2
    puts "  |-----------|"
  end
end

class Game
  attr_accessor :current_player, :player1, :player2, :board

  def initialize(player1, player2)
    @player1, @player2 = player1, player2
    player1.mark = :X
    player2.mark = :O
    @current_player = player1
    @board = Board.new
  end

  def play
    current_player.display(board)

    until board.over?
      play_turn
    end

    if game_winner
      game_winner.display(board)
      puts "#{game_winner.name} wins!"
    else
      puts "Cat's game"
    end
  end

  def play_turn
    board.place_mark(current_player.get_move, current_player.mark)
    switch_players!
    current_player.display(board)
  end

  def game_winner
    return player1 if board.winner == player1.mark
    return player2 if board.winner == player2.mark
    nil
  end

  def switch_players!
    self.current_player = current_player == player1 ? player2 : player1
  end
end

if $PROGRAM_NAME == __FILE__

  print "Enter your name: "
  name = gets.chomp.strip
  human = HumanPlayer.new(name)
  garry = ComputerPlayer.new('garry')

  new_game = Game.new(human, garry)
  new_game.play
end
