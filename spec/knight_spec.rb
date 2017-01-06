require 'spec_helper.rb'
require_relative '../lib/chess/piece.rb'
require_relative '../lib/chess/knight.rb'

module Chess
  describe Knight do 
    context "#initialize" do
      context "when the piece is set to white" do
        let(:white_knight) { Knight.new("white", [7,4]) }
        it "assigns the piece as the white knight" do
  		  expect(white_knight.symbol).to eq "♘"
        end
      end
      context "when the piece is set to black" do
        let(:black_knight) { Knight.new("black", [0,4]) }
        it "assigns the piece as the black knight" do
  		  expect(black_knight.symbol).to eq "♞"
        end
      end
    end
    context "#possible_moves" do
      context "when the knight is on [7,4]" do
      	let(:knight) { Knight.new("white", [7,4]) }
      	it "returns the possible moves of ([6,2],[5,3],[5,5],[6,6])" do 
      	  expect(knight.possible_moves).to eq([[6,2],[5,3],[5,5],[6,6]])
      	end
      end
      context "when the knight is on [4,4]" do 
      	let(:knight) { Knight.new("white", [4,4]) }
      	it "returns the possible moves of ([3,2],[2,3],[2,5],[3,6],[5,6],[6,5],[6,3],[5,2])" do 
      	  expect(knight.possible_moves).to eq([[3,2],[2,3],[2,5],[3,6],[5,6],[6,5],[6,3],[5,2]])
      	end
      end
      context "when the knight is on [0,0]" do 
      	let(:knight) { Knight.new("white", [0,0]) }
      	it "returns the possible moves of ([1,2],[2,1])" do 
      	  expect(knight.possible_moves).to eq([[1,2],[2,1]])
      	end
      end
    end
  end
end