

class Flight

    attr_reader :passengers

    def initialize(flight_num, capacity)
        @flight_number = flight_num
        @capacity = capacity
        @passengers = []
    end

    def full?
        return true if @passengers.length >= @capacity
        false
    end

    def board_passenger(passenger)
        unless self.full?
            @passengers << passenger if passenger.has_flight?(@flight_number)
        end
    end

    def list_passengers
        arr = []
        @passengers.each {|p| arr << p.name}
        arr
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        board_passenger(passenger)
    end



end