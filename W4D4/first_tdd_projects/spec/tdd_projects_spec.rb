require "rspec"
gem "rspec"
require "tdd_projects.rb"

describe "#my_uniq" do
    it "removes duplicates from an array" do
        expect(my_uniq([1,2,1,3,3])).to eq([1,2,3])
    end
    it "returns an empty array" do
        expect(my_uniq([])).to eq([])
    end
end


describe "Array#two_sum" do
    it "finds pairs that sum to 0" do 
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
    it "keeps pairs in order" do 
        expect([-1, 0, 2, -2, 1].two_sum).to_not eq([[2, 3], [0, 4]])
    end
    it "returns an empty array when no pairs sum to 0" do 
        expect([1, 2, 3, 4, 5, 6, 7].two_sum).to eq([])
    end
end 

describe "#my_transpose" do 
    it "takes in a square matrix" do
        expect{my_transpose([[1], [1,2,3]])}.to raise_error("invalid matrix")
    end
    it "transposes a matrix" do
        expect(my_transpose([[1,2],[3,4]])).to eq([[1,3],[2,4]])
    end
end

describe "#stock_picker" do 
    it "takes an array of stock prices" do 
        expect{stock_picker("not an array")}.to raise_error("invalid input")
    end
    it "outputs the most profitable pair of days" do 
        expect(stock_picker([50, 52, 49, 60])).to eq([2, 3])
    end
    it "doesnt try to sell before buying" do 
        output = stock_picker([50, 52, 49, 60])
        expect(output).to eq(output.sort)
    end
end

describe "#towers_of_hanoi" do 
    subject(:tower) { Hanoi.new }
    context "#initialize" do
        it "initializes 2 empty arrays and 1 full array" do
            expect(tower.arrays).to eq([[1,2,3,4],[],[]])
        end
    end
    context "#move" do
        it "moves a piece from one array to another" do
            tower.move(0, 1)
            expect(tower.arrays).to eq([[2,3,4], [1], []])
        end
    end
    describe "should not allow a large disc to be placed on a small one" do
        it "raises an error if we move incorrectly" do
            tower.move(0, 1)
            expect{tower.move(0, 1)}.to raise_error("invalid move")
        end
    end
    describe "#won?" do
        it "should recognize a winning tower" do
            tower.arrays = [[],[],[1,2,3,4]]
            expect(tower.won?).to eq(true)
        end
    end
end