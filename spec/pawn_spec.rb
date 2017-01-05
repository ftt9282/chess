require 'spec_helper.rb'
require_relative '../lib/chess/piece.rb'
require_relative '../lib/chess/pawn.rb'

module Chess
  describe Pawn do 
    context "#initialize" do
      context "when the piece is set to white" do
        let(:white_pawn) { Pawn.new("white", [7,4]) }
        it "assigns the piece as the white pawn" do
  		  expect(white_pawn.symbol).to eq "♙"
        end
      end
      context "when the piece is set to black" do
        let(:black_pawn) { Pawn.new("black", [0,4]) }
        it "assigns the piece as the black pawn" do
  		  expect(black_pawn.symbol).to eq "♟"
        end
      end
    end
    context "#possible_moves" do
      context "when the white pawn is on [5,4]" do
      	let(:pawn) { Pawn.new("white", [5,4]) }
      	it "returns the possible moves of ([4,4])" do 
      	  expect(pawn.possible_moves).to eq([[4,4]])
      	end
      end
      context "when the black pawn is on [4,4]" do 
      	let(:pawn) { Pawn.new("black", [4,4]) }
      	it "returns the possible moves of ([5,4])" do 
      	  expect(pawn.possible_moves).to eq([[5,4]])
      	end
      end
      context "when the white pawn is on [6,0]" do 
      	let(:pawn) { Pawn.new("white", [6,0]) }
      	it "returns the possible moves of ([4,0],[5,0])" do 
      	  expect(pawn.possible_moves).to eq([[4,0],[5,0]])
      	end
      end
    end
  end
end