

class Cat

    def initialize(name, color, age)
        @name = name
        @color = color
        @age = age
    end

    def name 
        @name
    end

    def color 
        @color
    end

    def age
        @age 
    end

    def print
        p @name + " " + @color + "says Hi"
    end

    def name=(new_name)
        @name = new_name
    end

    def color=(new_color)
        @color = new_color
    end
    def age=(new_age)
        @age = new_age
    end
end
    
ivy = Cat.new("Ivy", "Black", 18)

p ivy.name = "Yokoivy"

p ivy