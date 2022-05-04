
class Card

    attr_reader :face_value, :face_down

    def initialize(face_value)
        @face_value = face_value
        @face_down = true
    end

    def display
        if @face_down == true
            return " "
        else
            return @face_value
        end
    end

    def hide
        @face_down = true
    end

    def reveal
        @face_down = false
    end

    def to_s
        @face_value.to_s
    end

    def ==(card)
        @face_value == card.face_value
    end


end