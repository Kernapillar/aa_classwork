require "rspec"
require "card.rb"
require "deck.rb"
require "game.rb"
require "hand.rb"
require "player.rb"


describe "Card" do 
    subject(:card) {Card.new(:king, :spade)}
    describe "#initialize" do
        it "should have a face value" do
            expect(card.face).to eq(:king)
        end
    
        it "should have a suit"  do  
        expect(card.suit).to eq(:spade)
        end

        it "should have a numerical value" do
            expect(card.value).to eq(13)
        end
    end

    describe "#to_s" do 
        it "should properly print its instance variables" do 
            expect(card.to_s).to eq("King of Spades")
        end
    end

end

describe "Deck" do
    subject(:deck) {Deck.new}
    describe "#initialize" do 
        it "should have an array of 52 cards" do 
            expect(deck.cards.length).to eq(52)
            ret_value = true
            deck.cards.each do |card|
                if !card.is_a?(Card)
                    ret_value = false
                end
            end
            expect(ret_value).to be true
        end
        it "should have an empty in_play array" do 
            expect(deck.in_play.length).to eq(0)
        end
    end

    describe "#shuffle" do 
        it "should shuffle cards in the deck" do
            other_deck = Deck.new
            shuffled1 = deck.shuffle_deck
            shuffled2 = other_deck.shuffle_deck
            expect(shuffled1).to_not eq(shuffled2)
        end
    end

    describe "#count" do 
        it "should return the total number of cards in the deck" do 
        expect(deck.count).to eq(52)
        end
    end

    describe "#refil_deck" do 
        it "should add the in_play cards back into the deck and shuffle"  do
            20.times do 
                deck.in_play << deck.cards.shift
            end
            deck.refil_deck
            expect(deck.count).to eq (52)
            expect(deck.in_play.length).to eq(0)
        end
    end


    
    describe "#draw" do
        it "draws a card from the deck" do 
            drawn = deck.draw
            expect(drawn).to eq(deck.in_play[-1])
            expect(deck.cards.count).to eq(51)
            expect(deck.in_play.count).to eq(1)
        end
    end
end