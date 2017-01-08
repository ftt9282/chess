module Chess
  class Game

  	def initialize
  	  @player1 = Player.new("white")
  	  @player2 = Player.new("black")
  	  @board = Board.new
  	end

  	def start_game
  	  puts "\n~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~"
  	  puts "         FRANZ'S CHESS CORNER          "
  	  puts "~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~"
  	  print"\nWelcome to my chess game! You may type 'save' or 'quit' at any \ntime to save/quit the game. Have fun!\n\n"
  	  while 1
  	    start_turn(@player1)
  	    start_turn(@player2)
  	  end
  	end

  	def start_turn(player)
      move_is_valid = false
      if @board.king_in_check?(player.color)
      	checkmate if @board.checkmate?(player.color)
      	puts "check..." 
      end
  	  until move_is_valid
  		@board.show_board
   	    move_set = player.select_move
  	  	move_is_valid = valid_move?(move_set, player)
  	  end
  	  @board.update_board(move_set)
  	end

  	def valid_move?(move_set, player)
  	  start_pos, end_pos = move_set
  	  if @board.check_piece_color(start_pos).nil? || @board.check_piece_color(start_pos) != player.color
  	  	puts "You need to select one of your own pieces. Try again...".colorize(:color => :red)
  	  	return false
  	  else
  	    moves = @board.filter_moves(start_pos)
  	    if !moves.include?(end_pos)
  	  	  puts "That move is not valid. Try again...".colorize(:color => :red)
  	  	  return false
  	    end
  	    @board.update_board(move_set)
  	  	if @board.king_in_check?(player.color)
  	  	  @board.update_board(move_set.reverse)
  	  	  puts "That move leaves your King in check. Try again...".colorize(:color => :red)
  	  	  return false
  	  	end 
  	  	@board.update_board(move_set.reverse)
  	  	true
  	  end
  	end

  	def checkmate
      puts "CHECKMATE!!!"
      @board.show_board
      exit
  	end

  end
end