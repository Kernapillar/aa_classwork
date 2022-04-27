require_relative "board.rb"
require_relative "human_player.rb"

class Game

    def initialize(size=3, *player_marks)
        @players = []
        player_marks.each do |player|
            @players << HumanPlayer.new(player)
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
            move = @current_player.get_position
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