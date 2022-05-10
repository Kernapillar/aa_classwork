require_relative "poly_tree_node/lib/00_tree_node.rb"
class KnightPathFinder

    attr_accessor :root_node, :considered_positions

    def initialize(position)
        @root_node = position
        @considered_positions = [position]
    end
    
    def build_move_tree
        self.root_node = PolyTreeNode.new(root_node)
        queue = [root_node]
        while queue.length > 0
            current_node = queue.shift
            current_position = current_node.value

            new_move_positions(current_position).each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                current_node.add_child(next_node)
                queue << next_node
            end
        
        end
        p "finished"
    end
    
    def self.valid_moves(position)
        directions = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
        valid = []
        directions.each do |d| #[1, 2]
            moves = []
            moves << d[0] + position[0]
            moves << d[1] + position[1]
            valid << moves if self.valid?(moves)
        end
        valid
    end

    def self.valid?(pos)
        pos.each do |value|
            unless value >=0 && value < 8 
                return false
            end
        end
        true
    end
    
    def new_move_positions(pos)
        new_pos =[]
        KnightPathFinder.valid_moves(pos).each do |possible_move|
            if !@considered_positions.include?(possible_move)
                new_pos << possible_move
                @considered_positions << possible_move
            end
        end
        new_pos
    end

    def find_path(end_pos)
        build_move_tree
        final_node = root_node.bfs(end_pos)
        trace_path_back(final_node)
    end

    def trace_path_back(end_pos)
        path = [end_pos]
        current_node = end_pos
        until current_node == nil
            path << current_node.parent
            current_node = current_node.parent
        end
        path[0...-1].reverse
    end

end
