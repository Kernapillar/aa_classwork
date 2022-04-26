require_relative "room"

class Hotel

    attr_reader :rooms

    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each {|k, v| @rooms[k] = Room.new(v)}
    end

    def name 
        up_name = @name.split
        up_name.each.with_index {|word, i| up_name[i] = word.capitalize}
        up_name.join(" ")
    end

    def room_exists?(name)
        @rooms.include?(name)
    end

    def check_in(person, room_name)
        if  !room_exists?(room_name)
            puts "sorry, room does not exist"
        else
            add_result = @rooms[room_name].add_occupant(person)
            if add_result
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        @rooms.values.each do |room|
            if !room.full?
                return true
            end
        end
        false
    end

    def list_rooms
        @rooms.keys.each do |name|
            puts "#{name}: #{@rooms[name].available_space}"
        end
    end
end
