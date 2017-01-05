require 'spec_helper.rb'
require_relative '../lib/chess/piece.rb'
require_relative '../lib/chess/rook.rb'

module Chess
  describe Rook do 
    context "#initialize" do
      context "when the piece is set to white" do
        let(:white_rook) { Rook.new("white", [7,4]) }
        it "assigns the piece as the white rook" do
  		  expect(white_rook.symbol).to eq "♖"
        end
      end
      context "when the piece is set to black" do
        let(:black_rook) { Rook.new("black", [0,4]) }
        it "assigns the piece as the black rook" do
  		  expect(black_rook.symbol).to eq "♜"
        end
      end
    end
    context "#possible_moves" do
      context "when the rook is on [7,4]" do
      	let(:rook) { Rook.new("white", [7,4]) }
      	it "returns the possible moves of ([7,3],[7,2],[7,1],[7,0],[6,4],[5,4],[4,4],[3,4],[2,4],[1,4],[0,4],[7,5],[7,6],[7,7])" do 
      	  expect(rook.possible_moves).to eq([[7,3],[7,2],[7,1],[7,0],[6,4],[5,4],[4,4],[3,4],[2,4],[1,4],[0,4],[7,5],[7,6],[7,7]])
      	end
      end
      context "when the Rook is on [4,4]" do 
      	let(:rook) { Rook.new("white", [4,4]) }
      	it "returns the possible moves of ([4,3],[4,2],[4,1],[4,0],[3,4],[2,4],[1,4],[0,4],[4,5],[4,6],[4,7],[5,4],[6,4],[7,4])" do 
      	  expect(rook.possible_moves).to eq([[4,3],[4,2],[4,1],[4,0],[3,4],[2,4],[1,4],[0,4],[4,5],[4,6],[4,7],[5,4],[6,4],[7,4]])
      	end
      end
      context "when the Rook is on [0,0]" do 
      	let(:rook) { Rook.new("white", [0,0]) }
      	it "returns the possible moves of ([0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0])" do 
      	  expect(rook.possible_moves).to eq([[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0]])
      	end
      end
    end
  end
end