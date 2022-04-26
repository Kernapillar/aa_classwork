class Room

    attr_reader :capacity, :occupants
  
    def initialize(cap)
        @capacity = cap
        @occupants = []
    end

    def full?
        return true if @occupants.length == @capacity
        false
    end

    def available_space
        return @capacity - @occupants.length
    end

    def add_occupant(name)
        unless self.full?
            @occupants << name
            return true
        end
        false
    end

end