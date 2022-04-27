class Player

    def get_move
        puts "enter a position with coordinates separated with a space like '4 7'"
        coord = gets.chomp.split
        ret_coords = []
        coord.each {|ele| ret_coords << ele.to_i}
        ret_coords
    end

end
