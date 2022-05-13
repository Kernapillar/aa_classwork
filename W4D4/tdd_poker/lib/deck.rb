require_relative "card.rb"
class Deck
    attr_reader :cards, :in_play
    def initialize
        @cards = fill_deck
        @in_play = []
        
    end

    def fill_deck
        card_arr = []
        faces = [:a, :"2", :"3", :"4", :"5", :"6", :"7", :"8", :"9", :"10", :j, :q, :k]
        suits = [:"♠", :"♥", :"♣️", :"♦️"]
        faces.each do |face|
            suits.each do |suit|
                card_arr << Card.new(face, suit)
            end
        end
        return card_arr️
    end

    def shuffle_deck
        @cards = cards.shuffle
    end

    def count
        cards.length
    end

    def refil_deck
        @cards = cards + in_play
        @in_play = []
        @cards.shuffle
    end

    def print
        @cards.each {|card| puts card.to_s}
    end

    def draw
        drawn = cards.shift
        @in_play << drawn
        drawn
    end
 

end

