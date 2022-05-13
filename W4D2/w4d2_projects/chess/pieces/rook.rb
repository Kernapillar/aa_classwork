require_relative "piece"
require_relative "modules/slideable.rb"

class Rook < Piece
    include Slideable  #Test this !!!
end