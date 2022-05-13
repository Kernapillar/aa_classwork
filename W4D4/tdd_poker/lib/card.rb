
class Card

    # CARD_VALS = {a:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:10,  j:11, q:12, k:13}

    attr_reader :face, :suit, :value
    def initialize(face, suit)
        @face = face
        @suit = suit
        # @value = CARD_VALS[face]
    end


    def to_s
        "#{face} of #{suit}s"
    end

    def inspect
        "<#{face} of #{suit}s>"
    end
end