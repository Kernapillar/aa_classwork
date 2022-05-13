require "singleton"
require_relative "piece"

class NullPiece < Piece
    include Singleton

    attr_reader :color, :symbol
    def initialize
        @color = nil
        @symbol = " "
    end

    def move_dir
        return []
    end


end