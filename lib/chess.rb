require_relative "chess/piece"
require_relative "chess/pawn"
require_relative "chess/rook"
require_relative "chess/knight"
require_relative "chess/bishop"
require_relative "chess/queen"
require_relative "chess/king"
require_relative "chess/board"

require "colorize"

module Chess
  b = Board.new
  b.color_board
end