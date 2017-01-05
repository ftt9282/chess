module Chess
  class Bishop < Piece
  	
  	attr_reader :color, :symbol
  	attr_accessor :position
    
    # grab the attributes from Piece class and assign symbol
    def initialize(color, position)
      super
      @color == "white" ? @symbol = "♗" : @symbol = "♝"
    end

    def possible_moves
      x, y = @position
      # calculates how far bishop can go in each direction before hitting the end of the board
      northwest_moves(x, y) + northeast_moves(x, y) + southeast_moves(x, y) + southwest_moves(x, y)
    end

    def northwest_moves(x, y)
      moves = []
      x -= 1
      y -= 1
      while x.between?(0,7) && y.between?(0,7)
        moves << [x,y]
        x -= 1
        y -= 1
      end
      moves
    end

    def northeast_moves(x, y) 
      moves = []
      x -= 1
      y += 1
      while x.between?(0,7) && y.between?(0,7)
        moves << [x,y]
        x -= 1
        y += 1
      end
      moves
    end

    def southeast_moves(x, y) 
      moves = []
      x += 1
      y += 1
      while x.between?(0,7) && y.between?(0,7)
        moves << [x,y]
        x += 1
        y += 1
      end
      moves
    end

    def southwest_moves(x, y)
      moves = [] 
      x += 1
      y -= 1
      while x.between?(0,7) && y.between?(0,7)
        moves << [x,y]
        x += 1
        y -= 1
      end
      moves
    end

  end
end