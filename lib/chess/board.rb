module Chess
  class Board
    
    def initialize
      @board = Array.new(8){Array.new(8)}
      #@last_move = nil
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
      	  #if !@board[xi][yi].nil? && @last_move == @board[xi][yi].position
      	  #	print space.colorize(:background => :light_blue)
      	  #else
      	  #end
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

    def filter_moves(position)
  	  x, y = position
  	  filtered_moves = []
  	  possible_moves = @board[x][y].possible_moves
  	  @board[x][y].class == Pawn ? filtered_moves += pawn_movements(possible_moves, @board[x][y].color, @board[x][y].position) : filtered_moves += all_other_movements(possible_moves, @board[x][y].color)
  	end

  	def all_other_movements(possible_moves, piece_color)
  	  valid_moves = []
  	  possible_moves.each do |direction|
        direction.each do |square|
          x, y = square
          if !@board[x][y].nil?
          	if @board[x][y].color != piece_color
          	  valid_moves << square
          	end
          	break
          else
          	valid_moves << square
          end
        end
  	  end
  	  valid_moves
  	end

  	def pawn_movements(possible_moves, color, position)
  	  valid_moves = []
  	  from_x, from_y = position
  	  if color == "white"
  	  	check_for_takes = [[from_x-1,from_y-1],[from_x-1,from_y+1]]
  	  else
  	  	check_for_takes = [[from_x+1,from_y-1],[from_x+1,from_y+1]]
  	  end
  	  check_for_takes.each do |pos|
        x, y = pos
        if !@board[x][y].nil? && @board[x][y].color != color
          valid_moves << pos
        end
  	  end
  	  possible_moves.each do |direction|
        direction.each do |square|
          x, y = square
          if @board[x][y].nil?
          	valid_moves << square
          end
        end
  	  end
  	  valid_moves
  	end

    def update_board(move_set)
      start_pos, end_pos = move_set
      x, y = start_pos
      to_x, to_y = end_pos
      #print "Moving the #{@board[x][y].class} from #{@board[x][y].position} to #{end_pos}\n"
      piece = @board[x][y]
      @board[to_x][to_y] = piece.class.new(piece.color, end_pos)
      @board[x][y] = nil
    end

    def king_in_check?(color, move_set = nil)      
      #update_board(move_set) if move_set
      position = find_king(color)
      @board.each_with_index do |x, xi|
      	x.each_with_index do |y, yi|
      	  if !@board[xi][yi].nil? && @board[xi][yi].color != color
      	  	moves_to_check = filter_moves(@board[xi][yi].position)
		    if moves_to_check.include?(position) 
		      #update_board(move_set.reverse) if move_set
		      return true
		    end	   
      	  end
      	end
      end
      #update_board(move_set.reverse) if move_set
      return false
    end

    def checkmate?(color)
      @board.each_with_index do |x, xi|
      	x.each_with_index do |y, yi|
      	  if !@board[xi][yi].nil? && @board[xi][yi].color == color
      	  	moves = filter_moves(@board[xi][yi].position)
      	  	moves.each do |to|
      	  	  to_x, to_y = to
      	  	  move_set = []
      	  	  if !@board[to_x][to_y].nil? && @board[to_x][to_y] != color
      	  	  	previous_class = @board[to_x][to_y].class
      	  	  	previous_color = @board[to_x][to_y].color
      	  	  	@board[to_x][to_y] = nil
      	  	  	in_check = king_in_check?(color)
      	  	  	@board[to_x][to_y] = previous_class.new(previous_color, to)
      	  	  	return false if !in_check
      	  	  end     	  	  
              move_set << @board[xi][yi].position << to
              update_board(move_set)
              in_check = king_in_check?(color)
              update_board(move_set.reverse)
              return false if !in_check
      	  	end
      	  end
      	end
      	true
      end
    end

    def find_king(color)
      @board.each_with_index do |x, xi|
      	x.each_with_index do |y, yi|
      	  return @board[xi][yi].position if @board[xi][yi].class == King && @board[xi][yi].color == color
      	end
      end
    end

    def check_piece_color(position)
      x, y = position
      @board[x][y].color
    end
  end
end