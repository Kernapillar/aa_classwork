require 'byebug'
class PolyTreeNode

    attr_accessor :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        # self_here!
        @children = []
    end

    def parent=(new_parent)
        if new_parent == nil
            @parent = new_parent
        end
        if @parent != new_parent 
            if @parent != nil
                @parent.children.each_with_index do |child, i|
                    if child == self
                        @parent.children = @parent.children[0...i] + @parent.children[i + 1..-1]
                    end
                end
            end
            @parent = new_parent
            @parent.children << self
        end
    end

    def add_child(child_node)
        if !@children.include?(child_node)
            # @children << child_node
            child_node.parent = self
        end
    end

    def remove_child(child_node)
        raise "error" if !self.children.include?(child_node)
        @children.each_with_index do |child, i|
            if child == child_node
                child.parent = nil
            end
        end
    end

    # searching stuff
    def inspect
        "<#{self.value}>"
    end

    def dfs(target_value)
        return self if self.value == target_value
        return nil if self.children.length == 0
        @children.each do |child|
            found = child.dfs(target_value)
            return found if found
        end
        nil
    end

    def bfs(target_value)
        queue = []
        queue << self
        while queue.length > 0
            current = queue.shift
            return current if current.value == target_value
            queue += current.children
        end
    end

end