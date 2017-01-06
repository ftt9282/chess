require 'spec_helper.rb'
require_relative '../lib/chess/piece.rb'
require_relative '../lib/chess/queen.rb'
require_relative '../lib/chess/bishop.rb'
require_relative '../lib/chess/rook.rb'

module Chess
  describe Queen do 
    context "#initialize" do
      context "when the piece is set to white" do
        let(:white_queen) { Queen.new("white", [7,4]) }
        it "assigns the piece as the white queen" do
  		  expect(white_queen.symbol).to eq "♕"
        end
      end
      context "when the piece is set to black" do
        let(:black_queen) { Queen.new("black", [0,4]) }
        it "assigns the piece as the black queen" do
  		  expect(black_queen.symbol).to eq "♛"
        end
      end
    end
    context "#possible_moves" do
      context "when the queen is on [7,4]" do
      	let(:queen) { Queen.new("white", [7,4]) }
      	it "returns the possible moves of ([7,3],[7,2],[7,1],[7,0],
                                           [6,3],[5,2],[4,1],[3,0],
                                           [6,4],[5,4],[4,4],[3,4],[2,4],[1,4],[0,4],
                                           [6,5],[5,6],[4,7],
                                           [7,5],[7,6],[7,7])" do 
      	  expect(queen.possible_moves).to eq([[7,5],[7,6],[7,7],[6,3],[5,2],[4,1],[3,0],[6,4],[5,4],[4,4],[3,4],[2,4],[1,4],[0,4],[6,5],[5,6],[4,7],[7,5],[7,6],[7,7]])
      	end
      end
      context "when the queen is on [4,4]" do 
      	let(:queen) { Queen.new("white", [4,4]) }
      	it "returns the possible moves of ([4,3],[4,2],[4,1],[4,0],
                                           [3,3],[2,2],[1,1],[0,0],
                                           [3,4],[2,4],[1,4],[0,4],
                                           [3,5],[2,6],[1,7],
                                           [4,5],[4,6],[4,7],
                                           [5,5],[6,6],[7,7],
                                           [5,4],[6,4],[7,4],
                                           [6,5],[7,6]
                                           )" do 
      	  expect(queen.possible_moves).to eq([[4,3],[4,2],[4,1],[4,0],[3,3],[2,2],[1,1],[0,0],[3,4],[2,4],[1,4],[0,4],[3,5],[2,6],[1,7],[4,5],[4,6],[4,7],[5,5],[6,6],[7,7],[5,4],[6,4],[7,4],[6,5],[7,6]])
      	end
      end
      context "when the queen is on [0,0]" do 
      	let(:queen) { Queen.new("white", [0,0]) }
      	it "returns the possible moves of ([0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],
                                           [1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7],
                                           [1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0])" do 
      	  expect(queen.possible_moves).to eq([[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7],])
      	end
      end
    end
  end
end