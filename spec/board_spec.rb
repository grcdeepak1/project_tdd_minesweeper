require_relative '../lib/board.rb'
require_relative '../lib/square.rb'
describe Board do
  describe "#initialize" do
    it "returns a board" do
      expect(subject).to be_a(Board)
    end
    it "returns a board with 2d array of squares" do
      expect(subject.matrix[0][0]).to be_a(Square)
    end
    it "returns a board with 2d array of 10x10 squares - rows" do
      expect(subject.matrix.size).to eq(10)
    end
    it "returns a board with 2d array of 10x10 squares - cols" do
      expect(subject.matrix[0].size).to eq(10)
    end
    it "should have 9 mines by default" do
      subject.extend(Enumerable)
      expect(subject.select { |sq| sq.mine? }.size).to eq(9)
    end
    it "all the square should be in state :none" do
      subject.extend(Enumerable)
      expect(subject.select { |sq| sq.state == :none }.size).to eq(100)
    end
  end
  describe "#render" do
    it "should show the remaining flags" do
      expect(subject).to receive(:remaining_flags)
      subject.render
    end
  end
end