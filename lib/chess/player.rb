module Chess
  class Player
  	
  	attr_reader :color
    def initialize(color)
      @name = get_name
      @color = color
    end

    def get_name
      puts "Hi there. What's your name?"
      gets.chomp
    end

    def select_move
      while 1
      	puts "#{@name}, select a beginning and an end move please. (ex. a4 e1)"
      	input = gets.chomp
      	exit if input == 'quit'
        begin
          start_move, end_move = convert_move_to_array(input)
        rescue Exception=>e
          puts e
        else
          return start_move, end_move
        end
      end
    end

    def convert_move_to_array(move)
      letter_hash = { :a => 0, :b => 1, :c => 2, :d => 3, :e => 4, :f => 5, :g => 6, :h => 7 }
      start_pos, end_pos = move.split()
      check_move_size(move, start_pos, end_pos)

      start_pos_y, start_pos_x = start_pos.split('')
      end_pos_y, end_pos_x = end_pos.split('')

      start_pos_x = start_pos_x.to_i
      end_pos_x = end_pos_x.to_i

      check_letter_range(letter_hash, start_pos_y, end_pos_y)
      check_number_range(start_pos_x, end_pos_x)

      start_pos_y = letter_hash[start_pos_y.to_sym]
      end_pos_y = letter_hash[end_pos_y.to_sym]
      start_pos_x, end_pos_x = assign_numbers(start_pos_x-1, end_pos_x-1)
      check_for_same_space([start_pos_x, start_pos_y], [end_pos_x, end_pos_y])

      return [start_pos_x, start_pos_y], [end_pos_x, end_pos_y]
    end

    def assign_numbers(start_pos_x, end_pos_x)
      start_pos_x = (start_pos_x - 7).abs
      end_pos_x = (end_pos_x - 7).abs
      return start_pos_x, end_pos_x
    end

    def check_letter_range(letter_hash, start_pos_y, end_pos_y)      
      unless letter_hash.key?(start_pos_y.to_sym) && letter_hash.key?(end_pos_y.to_sym)
      	invalid_range
      end
    end

    def check_number_range(start_pos_x, end_pos_x)
      unless start_pos_x.between?(1,8) && end_pos_x.between?(1,8)
      	invalid_range
      end
    end

    def check_move_size(move, start_pos, end_pos)
      unless move.size == 5 && (start_pos.size == 2 && end_pos.size == 2)
      	invalid_input    	
      end
    end

    def check_for_same_space(start_pos, end_pos)
      if start_pos == end_pos
      	same_space
      end
    end

    def invalid_input
      raise "ERROR: That move you entered was invalid. Try again...".colorize(:color => :red)
    end

    def invalid_range
      raise "ERROR: That move you entered was out of range. Range is a-h and 1-8. Try again...".colorize(:color => :red)
    end

    def same_space
      raise raise "ERROR: You literally just tried to move no where. Try again...".colorize(:color => :red)
    end

  end
end