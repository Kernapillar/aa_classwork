module Slideable

    def straight_line(pos)
        up = []
        down = []
        left = []
        right = []
        (1..7).each do |i|
            right << [pos[0], pos[1] + i]
            down << [pos[0] + i, pos[1]]
            left << [pos[0], pos[1] - i]
            up << [pos[0] - i, pos[1]]
        end

        return verify(up) + verify(down) + verify(left) + verify(right)
    end

    def diagonal(pos)
        top_left = []
        top_right = []
        bottom_left = []
        bottom_right = []
        (1..7).each do |i|
            bottom_right << [pos[0] + i, pos[1] + i]
            bottom_left << [pos[0] + i, pos[1] - i]
            top_left << [pos[0] - i, pos[1] - i]
            top_right << [pos[0] - i, pos[1] + i]
        end
        return verify(top_left) + verify(top_right) + verify(bottom_left) + verify(bottom_right)
    end

    def verify(arr)
        arr.each_with_index do |pos, i|
            if !pos[0].between(0, 7) || !pos[1].between(0, 7) 
                return arr[0...i]
            elsif board[pos].color != self.color && board[pos].color != nil
                return arr[0...i]
            elsif board[pos].color == self.color
                return arr[0..i]
            end
        end
    end

    # def moves(available_directions)
    #     available_moves = []
    #     if available_directions == :diagonal
    #         (-7..7).each do |i|
    #             (-7..7).each do |j|
    #                 available_moves << [i, j] if i.abs == j.abs
    #             end
    #         end
    #     elsif available_directions == :horizontal

    #     else
    #         # both
    #     end
    #     available_moves
    # end

end