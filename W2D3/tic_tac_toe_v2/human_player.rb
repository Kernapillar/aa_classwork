
class HumanPlayer

    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        begin
            puts "Player #{@mark}, select a space by entering 2 numbers with a space between (x y):"
            move = gets.chomp
            numbers = " 1234567890"
            move.each_char {|ele| raise exception if !numbers.include?(ele)}
            raise exception if move.length != 3
            coords = []
            nums = move.split 
            nums.each {|ele| coords << ele.to_i}
            raise exception if coords.length != 2
        rescue 
            puts "Invalid input, be sure to enter 2 numbers with a space between (x y)!"
            puts "Please try again:"
            retry
        end

        coords
    end

end