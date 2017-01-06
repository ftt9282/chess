module Chess
  class King < Piece
  	
  	attr_reader :color, :symbol
  	attr_accessor :position
    
    # grab the attributes from Piece class and assign symbol
    def initialize(color, position)
      super
      @color == "white" ? @symbol = "♔" : @symbol = "♚"
    end

    # lists all moves and then returns the ones that won't go off the board
    def possible_moves
      x, y = @position
      moves = [[x, y-1], [x-1, y-1], [x-1, y], [x-1, y+1], [x, y+1], [x+1, y+1], [x+1, y], [x+1, y-1]]
      moves.select do |position|
        position.all? { |number| number.between?(0,7) }
      end
    end

    # need to add castling
    # ...
    # end


  end
end