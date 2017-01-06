module Chess
  class Queen < Piece
  	
  	attr_reader :color, :symbol
  	attr_accessor :position
    
    # grab the attributes from Piece class and assign symbol
    def initialize(color, position)
      super
      @color == "white" ? @symbol = "♕" : @symbol = "♛"
    end

    # lists all moves and then returns the ones that won't go off the board
    def possible_moves
      bishop = Bishop.new(@color, @position)
      rook = Rook.new(@color, @position)
      queen = bishop.possible_moves + rook.possible_moves
      queen
    end
  end
end