require "./towers_of_hanoi"

describe TowersOfHanoi do
  let(:game) { TowersOfHanoi.new }
  let(:towers) { game.towers }

  describe "#towers" do
    it "exposes the game's @towers instance variable" do
      ivar = game.instance_variable_get(:@towers)

      expect(towers).to be(ivar)
    end

    it "stores an array of arrays" do
      expect(towers).to be_an_instance_of(Array)
      towers.each { |tower| expect(tower).to be_an_instance_of(Array) }
    end

    it "stores discs as integers" do
      towers.each do |tower|
        expect(tower.all? { |disc| disc.is_a?(Fixnum) }).to be_truthy
      end
    end
  end

  describe "#initialize" do
    it "by default, creates towers of size 3, 0, and 0" do
      expect(towers.map(&:length)).to eq([3, 0, 0])
    end

    it "sets the first tower to [3, 2, 1]" do
      expect(towers.first).to eq([3, 2, 1])
    end
  end

  describe "#move(from_tower, to_tower)" do
    let!(:disc) { towers[0].last }

    before(:each) do
      game.move(0, 1)
    end

    it "pops the disc off of from_tower" do
      expect(towers[0]).to eq([3, 2])
    end

    it "pushes the disc onto to_tower" do
      expect(towers[1]).to eq([1])
    end

    it "doesn't change uninvolved towers" do
      expect(towers[2]).to be_empty
    end
  end

  describe "#valid move?(from_tower, to_tower)" do
    context "when from_tower is empty" do
      it "returns false" do
        expect(game.valid_move?(1, 0)).to be_falsey
      end
    end

    context "when moving a larger disc onto a smaller disc" do
      it "returns false" do
        game.move(0, 1)

        expect(game.valid_move?(0, 1)).to be_falsey
      end
    end

    context "when moving a smaller disc onto a larger one" do
      it "returns true" do
        expect(game.valid_move?(0, 1)).to be_truthy
      end
    end
  end

  describe "#won?" do
    context "when all discs have been moved to the middle or last stack" do
      it "returns true" do
        [[0, 1], [0, 2], [1, 2], [0, 1], [2, 0], [2, 1], [0, 1]].each do |move|
          game.move(*move)
        end

        expect(game.won?).to be_truthy
      end
    end

    context "when the game is incomplete" do
      it "returns false" do
        expect(game.won?).to be_falsey

        [[0, 1], [0, 2], [1, 2], [0, 1]].each do |move|
          game.move(*move)
        end

        expect(game.won?).to be_falsey
      end
    end
  end
end
