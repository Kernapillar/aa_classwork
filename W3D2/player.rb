class Player
    def prompt
        puts "Enter the coordinates for a guess: "
        position = gets.chomp.split
        position[0] = position[0].to_i
        position[1] = position[1].to_i
        return position
    end
end