require 'spec_helper.rb'
require_relative '../lib/chess/piece.rb'

module Chess
  describe Piece do 
    context "#initialize" do
      context "when the piece is set to black" do
        let(:piece) { Piece.new(:black, "a1") }
        it "sets a color to black" do  
          expect(piece.color).to eq :black
        end
      end
      context "when the piece is set to red" do
        let(:piece) { Piece.new(:red, "a1") }
        it "sets a color to red" do        
          expect(piece.color).to eq :red
        end
      end
      context "when a position is set" do
        let(:piece) { Piece.new(:red, "a1") }
        it "sets a position" do
          expect(piece.position).to eq "a1"
        end
      end
    end
  end
end