require 'spec_helper.rb'
require_relative '../lib/chess/piece.rb'
require_relative '../lib/chess/bishop.rb'

module Chess
  describe Bishop do 
    context "#initialize" do
      context "when the piece is set to white" do
        let(:white_bishop) { Bishop.new("white", [7,4]) }
        it "assigns the piece as the white bishop" do
  		  expect(white_bishop.symbol).to eq "♗"
        end
      end
      context "when the piece is set to black" do
        let(:black_bishop) { Bishop.new("black", [0,4]) }
        it "assigns the piece as the black bishop" do
  		  expect(black_bishop.symbol).to eq "♝"
        end
      end
    end
    context "#possible_moves" do
      context "when the bishop is on [7,4]" do
      	let(:bishop) { Bishop.new("white", [7,4]) }
      	it "returns the possible moves of ([6,3],[5,2],[4,1],[3,0],[6,5],[5,6],[4,7])" do 
      	  expect(bishop.possible_moves).to eq([[6,3],[5,2],[4,1],[3,0],[6,5],[5,6],[4,7]])
      	end
      end
      context "when the bishop is on [4,4]" do 
      	let(:bishop) { Bishop.new("white", [4,4]) }
      	it "returns the possible moves of ([3,3],[2,2],[1,1],[0,0],[3,5],[2,6],[1,7],[5,5],[6,6],[7,7],[5,3],[6,2],[7,1])" do 
      	  expect(bishop.possible_moves).to eq([[3,3],[2,2],[1,1],[0,0],[3,5],[2,6],[1,7],[5,5],[6,6],[7,7],[5,3],[6,2],[7,1]])
      	end
      end
      context "when the bishop is on [0,0]" do 
      	let(:bishop) { Bishop.new("white", [0,0]) }
      	it "returns the possible moves of ([1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7])" do 
      	  expect(bishop.possible_moves).to eq([[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7]])
      	end
      end
    end
  end
end