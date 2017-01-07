module Chess
  class Game

  	def initialize
  	  @player1 = Player.new("white")
  	  @player2 = Player.new("black")
  	  @board = Board.new
  	end

  	def start_game
  	  @board.show_board
  	  @board.update_board(@player1.select_move)
  	  @board.show_board
  	end

  end
end