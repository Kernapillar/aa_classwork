require_relative "pieces/piece.rb"
require_relative "pieces/null_piece.rb"


class Board
    
    def initialize
        @null_piece = NullPiece
        @board = Array.new(8) {Array.new(8, @null_piece)}
    end

    def fresh_board
        start_positions = {R:[[0, 0], [0, 7], [7, 0], [7, 7]], KN:[[0, 1], [0, 6], [7, 1], [7, 6]], B:[[0, 2], [0, 5], [7, 2], [7, 5]], K:[[0, 3], [7, 3]], Q:[[0, 4], [7, 4]]}
        start_positions.each do |piece, positions|
            positions.each do |pos|
                i, j = pos
                if i == 0 || i == 1
                    color = :white
                else
                    color = :black
                end
                board[i][j] = Piece.new(piece, color) #add cases, for dif piece class
                # case piece
                # when :R
                # board[i][j] = Rook.new
            end
        end
        (0..7).each do |i|
            board[1][i] = Piece.new(:P, :white) #replace w/ Pawn.new
            board[6][i] = Piece.new(:P, :black)
            (2..5).each do |j|
                board[j][i] = null_piece
            end
        end
        puts "board has been reset"
    end

    def print
        board.each do |row|
            row.each do |piece|
                print "#{piece.symbol} "
            end
            puts
        end
    end

    def [](pos)
        i, j = pos
        board[i][j]
    end

    def []=(pos, val)
        i, j = pos
        board[i][j] = val
    end

    def move_piece(start_pos, end_pos)
        raise "no piece at position: #{start_pos}" if self[start_pos] == null_piece
        # Check if piece cannot move to end pos and raise error
        raise "invalid end pos: #{end_pos}" if !valid_pos?(end_pos)
        puts "start position: #{start_pos}"
        puts "start position: #{end_pos}"

        current_piece = self[start_pos]
        self[end_pos] = current_piece
        self[start_pos] = null_piece
    end

    def valid_pos?(pos)
        return false if !pos[0].between?(0,7)
        return false if !pos[1].between?(0,7)
        return true
    end

    def add_piece(piece, pos)

    end

    def checkmate?(color)
    end

    def in_check?(color)

    end

    def find_king(color)
    end

    def pieces

    end

    def dup
    end

    def move_piece!(color, start_pos, end_pos)
    end

    private
    attr_reader :board, :null_piece

end