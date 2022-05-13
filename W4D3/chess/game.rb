require_relative "display"

class Game
    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @player1 = :white
        @player2 = :black
        @current_player = @player1
    end

    def run
        @display.cursor_updater
    end

    
end

g = Game.new
g.run