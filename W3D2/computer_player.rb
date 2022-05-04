class ComputerPlayer
    def initialize(size)
        @possible_moves = []
        @known_cards = Hash.new { |h, k| h[k] = [] }
        self.get_moves(size)
        @next_guess = nil
        @matched_cards = []
    end

    def get_moves(size)
        i = 0
        while i < size
            j = 0
            while j < size
                @possible_moves << [i, j]
                j += 1
            end
            i += 1
        end
        @possible_moves = @possible_moves.sample(@possible_moves.length)
    end

    def prompt
        # If there is a next guess that creates a match, guess it
        if @next_guess != nil
            move = @next_guess
            @next_guess = nil
            return move
        end
        # If there is a known match, guess one and save the other
        @known_card.each do |k, v|
            if v.length == 2 && !@matched_cards.include?(v[0])
                @next_guess = v[0]
                return v[1]
            end
        end
        # If the first guess reveals a match, complete the match



        # Last case scenario, make a random move
        move = @possible_moves.pop
        move
    end

    def receive_revealed_card(position, face_value)
        @known_cards[face_value] << position
    end

    def receive_match(pos1, pos2)
        matched_cards << pos1
        matched_cards << pos2
    end

end