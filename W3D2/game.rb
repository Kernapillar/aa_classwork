require_relative "board.rb"
require_relative "player.rb"

class Game

    attr_reader :board, :previous_guess

    def initialize(size=4)
        @board = Board.new(size)
        @placeholder = Card.new("nil")
        @previous_guess = @placeholder
        @player = ComputerPlayer.new
    end

    def play
        while !board.won?
            board.render
            position = @player.prompt
            self.make_guess(position)
        end
        puts "you win!"
    end

    def make_guess(position)
        card = board[position]
        @player.receive_revealed_card(position, card.face_value)
        if @previous_guess == @placeholder
            card.reveal
            @previous_guess = card
        
        # Found a match
        elsif @previous_guess == card
            @player.receive_match(position, @previous_guess.get_position)
            card.reveal
            self.card_reset
        else
            card.reveal
            @board.render
            sleep(2)
            system("clear")
            @previous_guess.hide
            card.hide
            self.card_reset
        end
    end

    def card_reset
        @previous_guess = @placeholder
    end

end