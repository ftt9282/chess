module Chess
  class Game

  	def initialize
  	  @player1 = Player.new("white")
  	  @player2 = Player.new("black")
  	  @board = Board.new
  	end

  	def start_game
  	  move_is_valid = false
  	  until move_is_valid
  	  	@board.show_board
  	  	move_is_valid = valid_move?(@player1.select_move)
  	  end
  	end

  	def valid_move?(move_set)
  	  start_pos, end_pos = move_set
  	  @board.filter_moves(start_pos, end_pos)
  	  true
  	end

  end
end