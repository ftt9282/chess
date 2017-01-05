require 'spec_helper.rb'
require_relative '../lib/chess/piece.rb'

module Chess
  describe Piece do 
    context "#initialize" do
      context "when the piece is set to black" do
        let(:piece) { Piece.new("black", [0,0]) }
        it "sets a color to black" do  
          expect(piece.color).to eq "black"
        end
      end
      context "when the piece is set to red" do
        let(:piece) { Piece.new("white", [0,0]) }
        it "sets a color to white" do        
          expect(piece.color).to eq "white"
        end
      end
      context "when a position is set" do
        let(:piece) { Piece.new("white", [0,0]) }
        it "sets a position" do
          expect(piece.position).to eq [0,0]
        end
      end
    end
  end
end