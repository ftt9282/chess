module Chess
  class Piece    
    
    # when board is populated pieces are fed a color and position
    attr_accessor :color, :position   
    def initialize(color, position)
  	  @color = color
      @position = position
    end

  end
end