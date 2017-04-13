describe "Board" do
  let(:board) { Board.new }

  describe "#grid" do
    it "should expose the board's @grid instance variable" do
      ivar = board.instance_variable_get(:@grid)

      expect(board.grid).to be(ivar)
    end
  end

  describe "initialize" do
    context "when passed a grid argument" do
      it "sets the board's grid to the value passed in" do
        grid = [[1, 2], [3, 4]]
        board = Board.new(grid)

        expect(board.grid).to be(grid)
      end
    end

    context "when no grid is passed in" do
      it "creates a 3 by 3 grid of nil values" do
        expect(board.grid.length).to eq(3)
        board.grid.each do |row|
          expect(row.length).to eq(3)
          expect(row.all?(&:nil?)).to be_truthy
        end
      end
    end
  end

  describe "place_mark(pos, mark)" do
    it "should change the value of a square" do
      board.place_mark([0, 0], :X)

      expect(board.grid[0][0]).to eq(:X)
    end
  end

  describe "empty?" do
    context "when the square is empty" do
      it "returns true" do
        expect(board.empty?([0, 0])).to be_truthy
      end
    end

    context "when the square is marked" do
      it "returns false" do
        place_marks([[0, 0]], :X)

        expect(board.empty?([0, 0])).to be_falsey
      end
    end
  end

  describe "winner" do
    context "when :X has won" do
      context "on a row" do
        it "returns :X" do
          place_marks([[0, 0], [0, 1], [0, 2]], :X)

          expect(board.winner).to be :X
        end
      end

      context "on the left diagonal" do
        it "returns :X" do
          place_marks([[0, 0], [1, 1], [2, 2]], :X)

          expect(board.winner).to be :X
        end
      end

      context "on the right diagonal" do
        it "returns :X" do
          place_marks([[0, 2], [1, 1], [2, 0]], :X)

          expect(board.winner).to be :X
        end
      end
    end

    context "when :O has won a column" do
      it "returns :O" do
        place_marks([[0, 2], [1, 2], [2, 2]], :O)

        expect(board.winner).to be :O
      end
    end

    context "when there is no winner" do
      it "returns nil" do
        expect(board.winner).to be nil

        fill_cats_game

        expect(board.winner).to be nil
      end
    end
  end

  describe "over?" do
    context "when the board is empty" do
      it "returns false" do
        expect(board.over?).to be_falsey
      end
    end

    context "when the board is in progress" do
      it "returns false" do
        place_marks([[0, 0], [0, 1]], :X)
        place_marks([[0, 2]], :O)

        expect(board.over?).to be_falsey
      end
    end

    context "when the game is won" do
      it "returns true" do
        place_marks([[0, 0], [0, 1], [0, 2]], :X)

        expect(board.over?).to be_truthy
      end
    end

    context "when the game is tied" do
      it "returns true" do
        fill_cats_game

        expect(board.over?).to be_truthy
      end
    end
  end
end

describe "ComputerPlayer" do
  let(:comp) { ComputerPlayer.new("Bonzo") }
  let(:board) { Board.new }

  describe "#initialize" do
    it "sets an instance variable to the given name" do
      expect(comp.instance_variable_get(:@name)).to eq("Bonzo")
    end
  end

  describe "display" do
    it "should set the value of the `#board` instance variable" do
      comp.display(board)

      expect(comp.board).to eq(board)
    end
  end

  describe "get_move" do
    context "when a winning move is available" do
      it "should return the winning move" do
        place_marks([[0, 0], [1, 0]], :O)
        comp.mark = :O
        comp.display(board)

        expect(comp.get_move).to eq([2, 0])
      end
    end

    context "when no winning move is available" do
      it "returns a random move" do
        comp.display(board)
        pos = comp.get_move

        expect(pos).to be_an_instance_of(Array)
        expect(pos.length).to eq(2)
      end
    end
  end
end

describe "HumanPlayer" do
  let(:human) { HumanPlayer.new("Frankie") }
  let(:board) { Board.new }

  class NoMoreInput < StandardError
  end

  before do
    $stdout = StringIO.new
    $stdin = StringIO.new

    class HumanPlayer
      def gets
        result = $stdin.gets
        raise NoMoreInput unless result

        result
      end
    end

    def recent_output
      outputs = $stdout.string.split("\n")
      max = [outputs.length, 5].min
      outputs[-max..-1].join(" ")
    end

    def human.get_move!
      get_move
      rescue NoMoreInput
    end
  end

  after :all do
    $stdout = STDOUT
    $stdin = STDIN
  end

  describe "#initialize" do
    it "initializes with a name" do
      expect(human.name).to eq("Frankie")
    end
  end

  describe "#get_move" do
    it "asks for a move" do
      human.get_move!
      expect($stdout.string.downcase).to match(/where/)
    end

    it "should take an entry of the form '0, 0' and return a position" do
      $stdin.string << "0, 0"

      expect(human.get_move).to eq([0, 0])
    end
  end

  describe "#display" do
    it "prints the board to the screen" do
      board.place_mark([0, 0], :X)
      human.display(board)

      expect($stdout.string).to match(/X/)
    end
  end
end

describe "Game" do
  let(:player_one) { double("player", name: "Claire", mark: :X) }
  let(:player_two) { double("player", name: "Gizmo", mark: :O) }

  let(:game) do
    Game.new(player_one, player_two)
  end

  before(:each) do
    allow(player_one).to receive(:mark=)
    allow(player_two).to receive(:mark=)
  end

  describe "#board" do
    it "exposes a @board instance variable" do
      ivar = game.instance_variable_get(:@board)

      expect(game.board).to be(ivar)
      expect(game.board).to be_an_instance_of(Board)
    end
  end

  describe "#play_turn" do
    before(:each) do
      allow(player_one).to receive(:display)
      allow(player_two).to receive(:display)
      allow(player_one).to receive(:get_move).and_return([0, 0])
    end

    it "gets a move from the current player and performs it" do
      expect(player_one).to receive(:get_move).and_return(:move)
      expect(game.board).to receive(:place_mark).with(:move, :X)

      game.play_turn
    end

    it "passes the turn to the other player" do
      expect(game).to receive(:switch_players!)

      game.play_turn
    end
  end

  describe "#current_player" do
    it "starts set to the first player passed to Game.new" do
      expect(game.current_player).to be(player_one)
    end
  end

  describe "switch_players!" do
    it "updates the value of current_player" do
      expect(game.current_player).to be(player_one)

      game.switch_players!

      expect(game.current_player).to be(player_two)
    end
  end
end
# spec helper methods

def place_marks(marks, sym)
  marks.each { |pos| board.place_mark(pos, sym) }
end

def fill_cats_game
  [[0, 0], [1, 1], [1, 2], [2, 1]].each do |pos|
    board.place_mark(pos, :X)
  end

  [[0, 1], [0, 2], [1, 0], [2, 0], [2, 2]].each do |pos|
    board.place_mark(pos, :O)
  end
end
