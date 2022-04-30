require "byebug"

class Item

    attr_accessor :title, :description

    def self.valid_date?(date_str)
        # YYYY-MM-DD
        
        return false if date_str.length != 10
        return false if date_str[5..6].to_i < 1 || date_str[5..6].to_i > 12
        return false if date_str[8..9].to_i < 1 || date_str[8..9].to_i > 31
        return false unless date_str[4] == "-" && date_str[7] == "-"
        true
    end

    def initialize(title, deadline, description, done=false)
        @title = title
        if self.class.valid_date?(deadline)
            @deadline = deadline
        else
            raise "invalid deadline date"
        end
        @description = description
        @done = done
    end

    def deadline
        @deadline
    end

    def deadline=(new_deadline)
        if self.class.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "invalid deadline date"
        end
    end

    def toggle
        if @done == true
            @done = false
        else
            @done = true
        end
    end


end


