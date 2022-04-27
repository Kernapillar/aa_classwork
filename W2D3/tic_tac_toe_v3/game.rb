require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game

    def initialize(size=3, **marks)
        @players = []
        marks.each do |mark, value|
            if value == false
                @players << HumanPlayer.new(mark)
            else
                @players << ComputerPlayer.new(mark)
            end
        end
        @board = Board.new(size)
        @current_player = @players[0]
    end

    def switch_turn
        @players = @players.rotate
        @current_player = @players[0]
    end

    def play
        while @board.empty_positions?

            @board.print
            move = @current_player.get_position(@board.legal_positions)
            @board.place_mark(move, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "Congratulations, #{@current_player.mark} has won!"
                return 
            end
            switch_turn
        end
        puts "Game ended in a Draw!"
    end


end