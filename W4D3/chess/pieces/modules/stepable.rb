module Stepable
    def knight_move(pos)
        valid_moves = []
        directions = [[1,2],[2,1],[-1,2],[1,-2],[-1,-2],[-2,-1],[2,-1],[-2,1]]
        directions.each do |dir|
            move = [pos[0] + dir[0], pos[1] + dir[1]]
            valid_moves << move if verify(move)
        end
        return valid_moves
    end

    def king_move(pos)
        valid_moves = []
        directions = [[1,0],[0,1],[-1,0],[0,-1],[-1,-1],[1,-1],[1,1],[-1,1]]
        directions.each do |dir|
            move = [pos[0] + dir[0], pos[1] + dir[1]]
            valid_moves << move if verify(move)
        end
        return valid_moves
    end

    def verify(pos)
        if !pos[0].between?(0, 7) || !pos[1].between?(0, 7) 
            return false
        elsif board[pos].color != self.color
            return true
        elsif board[pos].color == self.color
            return false
        end
    end
end