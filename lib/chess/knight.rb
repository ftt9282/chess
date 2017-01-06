module Chess
  class Knight < Piece
  	
  	attr_reader :color, :symbol
  	attr_accessor :position
    
    # grab the attributes from Piece class and assign symbol
    def initialize(color, position)
      super
      @color == "white" ? @symbol = "♘" : @symbol = "♞"
    end

    # lists all moves and then returns the ones that won't go off the board
    def possible_moves
      x, y = @position
      moves = [[x-1,y-2], [x-2,y-1], [x-2,y+1], [x-1,y+2], [x+1,y+2], [x+2,y+1], [x+2,y-1], [x+1,y-2]]
      moves.select do |position|
        position.all? { |number| number.between?(0,7) }
      end
    end
  end
end