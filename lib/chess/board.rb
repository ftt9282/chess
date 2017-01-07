module Chess
  class Board
    
    def initialize
      @board = Array.new(8){Array.new(8)}
      populate_board
    end

    def show_board
      color = [:red, :light_black]
      @board.each_with_index do |x, xi|
      	print (xi - 8).abs.to_s + " "
      	x.each_with_index do |y, yi|

      	  if @board[xi][yi].nil?
      	  	space = "    "
      	  else
      	  	space = " " + "#{@board[xi][yi].symbol}" + "  "
      	  end
      	  print space.colorize(:background => color[yi%2])
      	end
      	print "\n"
      	color.reverse!
      end
      print "   A   B   C   D   E   F   G   H\n"
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

    def update_board(move_set)
      start_pos, end_pos = move_set
      x, y = start_pos
      to_x, to_y = end_pos
      piece = @board[x][y]
      @board[to_x][to_y] = piece.class.new(piece.color, end_pos)
      @board[x][y] = nil
    end

  end
end