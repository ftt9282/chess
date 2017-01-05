require 'spec_helper.rb'
require_relative '../lib/chess/piece.rb'
require_relative '../lib/chess/king.rb'

module Chess
  describe King do 
    context "#initialize" do
      context "when the piece is set to white" do
        let(:white_king) { King.new("white", [7,4]) }
        it "assigns the piece as the white king" do
  		  expect(white_king.symbol).to eq "♔"
        end
      end
      context "when the piece is set to black" do
        let(:black_king) { King.new("black", [0,4]) }
        it "assigns the piece as the black king" do
  		  expect(black_king.symbol).to eq "♚"
        end
      end
    end
    context "#possible_moves" do
      context "when the king is on [7,4]" do
      	let(:king) { King.new("white", [7,4]) }
      	it "returns the possible moves of ([7,3],[6,3],[6,4],[6,5],[7,5])" do 
      	  expect(king.possible_moves).to eq([[7,3],[6,3],[6,4],[6,5],[7,5]])
      	end
      end
      context "when the king is on [4,4]" do 
      	let(:king) { King.new("white", [4,4]) }
      	it "returns the possible moves of ([4,3],[3,3],[3,4],[3,5],[4,5],[5,5],[5,4],[5,3])" do 
      	  expect(king.possible_moves).to eq([[4,3],[3,3],[3,4],[3,5],[4,5],[5,5],[5,4],[5,3]])
      	end
      end
      context "when the king is on [0,0]" do 
      	let(:king) { King.new("white", [0,0]) }
      	it "returns the possible moves of ([0,1],[1,1],[1,0])" do 
      	  expect(king.possible_moves).to eq([[0,1],[1,1],[1,0]])
      	end
      end
    end
  end
end