module Chess
  class Pawn < Piece
    
    attr_reader :color, :symbol
    attr_accessor :position
    
    # grab the attributes from Piece class and assign symbol
    def initialize(color, position)
      super
      @color == "white" ? @symbol = "♙" : @symbol = "♟"
    end

    def possible_moves
      x, y = @position
      all_moves = []
      moves = []
      # checks if the pawn is eligible for a double step
      if (x == 6 && @color == "white") || (x == 1 && @color == "black")
        @color == "white" ? moves << [x-2, y] : moves << [x+2, y]
      end
      # return the regular moves
      @color == "white" ? moves << [x-1, y] : moves << [x+1, y]
      moves.each do |position|
        all_moves << [position] if position.all? { |number| number.between?(0,7) }
      end
      all_moves
    end

  end
end