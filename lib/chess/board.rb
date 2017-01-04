module Chess
  class Board
    
    def initialize
      @board = Array.new(8){Array.new(8)}
      color_board
    end

    def color_board
      color = [:red, :light_black]
      @board.each_with_index do |x, xi|
      	x.each_with_index do |y, yi|
      	  @board[xi][yi] = "____".colorize(:color => :black, :background => color[yi%2])
      	end
      	color.reverse!
      end
      populate_board
    end

    def populate_board
      
    end

  end
end