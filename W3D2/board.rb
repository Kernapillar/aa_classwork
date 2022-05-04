require_relative "./card.rb"

class Board

    def initialize(size = 4)
        @size = size
        @grid = Array.new(size) { Array.new }
        self.populate
    end

    def populate
        num_pairs = @size ** 2 / 2
        pairs = [:A, :B, :C, :D, :E, :F, :G, :H]
        cards = []
        pairs.each do |face| 
            card1 = Card.new(face)
            card2 = Card.new(face)
            cards << card1
            cards << card2
        end
        shuffled = cards.sample(cards.length)
        @grid.each_index do |i|
            @grid.each_index do |j|
                @grid[i][j] = shuffled.pop
            end
        end
    end

    def render
        str = "  "
        i = 0
        while i < @size
            str += i.to_s + " "
            i += 1
        end
        puts str
        puts "  --------"

        @grid.each_with_index do |row, i|
            str = "#{i}|"
            row.each do |card|
                str += card.display.to_s + " "
            end
            puts str
        end
    end

    def won?
        @grid.each do |row|
            row.each { |ele| return false if ele.face_down }
        end
        true
    end

    def reveal_all
        @grid.each do |row|
            row.each { |ele| ele.reveal }
        end
    end

    def reveal(guessed_position)
        card = self[guessed_position]
        if card.face_down
            card.reveal
            return card.face_value
        else
            return false
        end
    end

    def [](position)
        @grid[position[0]][position[1]]
    end

    def []=(position, card)
        @grid[position[0]][position[1]] = card
    end

    def get_position(card)
        @grid.each_with_index do |row, i|
            row.each_with_index do |ele, j|
                if ele.object_id == card.object_id
                    return [i, j]
                end
            end
        end
    end
end