module Chess
  class Board
    
    def initialize
      @board = Array.new(8){Array.new(8)}
      @empty_space = "_"
      populate_board
    end

    def color_board
      color = [:red, :light_black]
      @board.each_with_index do |x, xi|
      	x.each_with_index do |y, yi|
      	  @board[xi][yi] = "_____".colorize(:color => :black, :background => color[yi%2])
      	  print @board[xi][yi]
      	end
      	print "\n"
      	color.reverse!
      end
    end

    def populate_board
      @board.each_with_index do |x, xi|
      	case xi
      	when 0
      	  @board[0][0] = Rook.new("black", [0,0])
      	  @board[0][1] = Knight.new("black", [0,1])
      	  @board[0][2] = Bishop.new("black", [0,2])
      	  @board[0][3] = Queen.new("black", [0,3])
      	  @board[0][4] = King.new("black", [0,4])
      	  @board[0][5] = Bishop.new("black", [0,5])
      	  @board[0][6] = Knight.new("black", [0,6])
      	  @board[0][7] = Rook.new("black", [0,7])
      	when 1
      	  x.each_with_index do |y, yi|
      	    @board[1][yi] = Pawn.new("black", [1,yi])
      	  end
      	when 6
      	  x.each_with_index do |y, yi|
      	    @board[6][yi] = Pawn.new("white", [6,yi])
      	  end
      	when 7
      	  @board[7][0] = Rook.new("white", [7,0])
      	  @board[7][1] = Knight.new("white", [7,1])
      	  @board[7][2] = Bishop.new("white", [7,2])
      	  @board[7][3] = Queen.new("white", [7,3])
      	  @board[7][4] = King.new("white", [7,4])
      	  @board[7][5] = Bishop.new("white", [7,5])
      	  @board[7][6] = Knight.new("white", [7,6])
      	  @board[7][7] = Rook.new("white", [7,7])
      	else
      	  x.each_with_index do |y, yi|
      	    @board[xi][yi] = @empty_space
      	  end
      	end
      end
    end

  end
end