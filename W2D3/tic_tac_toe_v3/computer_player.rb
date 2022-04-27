class ComputerPlayer

    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(positions)
        move = positions.sample
        puts "Computer player '#{@mark}' has selected #{move}"
        move
    end




end