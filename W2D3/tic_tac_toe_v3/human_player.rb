
class HumanPlayer

    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(positions)
        begin
            puts "Player #{@mark}, select a space by entering 2 numbers with a space between (x y):"
            move = gets.chomp
            numbers = " 1234567890"
            move.each_char {|ele| raise exception if !numbers.include?(ele)}
            raise ArgumentError.new("invalid # of characters") if move.length != 3
            coords = []
            nums = move.split 
            nums.each {|ele| coords << ele.to_i}
            raise ArgumentError.new("invalid # of characters") if coords.length != 2
            raise ArgumentError.new("position not available") if !positions.include?(coords)
        rescue => e

            puts "Invalid input, exception: #{e}"
            puts "Please try again:"
            retry
        end

        coords
    end

end