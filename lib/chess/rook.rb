module Chess
  class Rook < Piece
  	
  	attr_reader :color, :symbol
  	attr_accessor :position
    
    # grab the attributes from Piece class and assign symbol
    def initialize(color, position)
      super
      @color == "white" ? @symbol = "♖" : @symbol = "♜"
    end

    def possible_moves
      x, y = @position
      # calculates how far bishop can go in each direction before hitting the end of the board
      west_moves(x, y) + north_moves(x, y) + east_moves(x, y) + south_moves(x, y)
    end

    def west_moves(x, y)
      moves = []
      y -= 1
      while y.between?(0,7)
        moves << [x,y]
        y -= 1
      end
      moves
    end

    def north_moves(x, y) 
      moves = []
      x -= 1
      while x.between?(0,7)
        moves << [x,y]
        x -= 1
      end
      moves
    end

    def east_moves(x, y) 
      moves = []
      y += 1
      while y.between?(0,7)
        moves << [x,y]
        y += 1
      end
      moves
    end

    def south_moves(x, y)
      moves = [] 
      x += 1
      while x.between?(0,7)
        moves << [x,y]
        x += 1
      end
      moves
    end

  end
end