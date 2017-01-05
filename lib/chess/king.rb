module Chess
  class King < Piece
  	
  	attr_reader :color, :symbol
  	attr_accessor :position
    
    def initialize(color, position)
      super
      @color == "white" ? @symbol = "♔" : @symbol = "♚"
    end

    def possible_moves
      x, y = @position
      moves = [[x, y-1], [x-1, y-1], [x-1, y], [x-1, y+1], [x, y+1], [x+1, y+1], [x+1, y], [x+1, y-1]]
      moves.select do |position|
        position.all? { |number| number.between?(0,7) }
      end
    end

  end
end