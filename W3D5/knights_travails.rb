require_relative "poly_tree_node/lib/00_tree_node.rb"
class KnightPathFinder

    def initialize(position)
        @root_node = PolyTreeNode.new(position)
        @considered_positions = [@root_node]
    end
    
    def build_move_tree(root_node)
        
    end
    
    def self.valid_moves(position)
        position.each do |value|
            unless value >=0 && value < 8
                puts "invalid position"
            end
        end
        
    end
    
    def new_move_positions(pos)
        KnightPathFinder.valid_moves
        if !@considered_positions.include?(position)
            @considered_positions << position
        end
    end
end