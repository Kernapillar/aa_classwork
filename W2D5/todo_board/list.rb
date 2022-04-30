require "byebug"
require_relative "item.rb"

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        return false unless Item.valid_date?(deadline)
        new_item = Item.new(title, deadline, description)
        @items << new_item
        true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index < 0 || index >= self.size
        true
    end

    def list_swap(index_1, index_2)
        return false unless valid_index?(index_1) && valid_index?(index_2)
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        true
    end

    def [](index)
        return nil unless (valid_index?(index))
        @items[index]
    end

    def priority
        @items[0]
    end

    def print
        puts "-------------------------------------------------"
        puts "#{@label.center(49)}"
        puts "-------------------------------------------------"
        puts "Index | Item                 | Deadline   | Done "
        puts "-------------------------------------------------"
        @items.each do |item|
            puts "#{@items.index(item).to_s.ljust(6)}| #{item.title.ljust(21)}| #{item.deadline}  | [#{item.done}]"
        end
        puts "-------------------------------------------------"
    end

    def print_full_item(index)
        return false unless valid_index?(index)
        item = self[index]

        puts "-------------------------------------------------"
        puts "#{item.title}".ljust(30) + "#{item.deadline}".rjust(12)
        puts "#{item.description}"
        puts "-------------------------------------------------"
    end

    def up(index, amount=1)
        return false unless valid_index?(index)
        item = @items[index]
        amount.times do 
            unless @items.index(item) == 0
                list_swap(@items.index(item), @items.index(item) - 1)
            end
        end
        true
    end

    def down(index, amount=1)
        return false unless valid_index?(index)
        item = @items[index]
        amount.times do 
            unless @items.index(item) == @items.length - 1
                list_swap(@items.index(item), @items.index(item) + 1)
            end
        end
        true
    end

    def print_priority
        self.print_full_item[0]
    end


    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

    def toggle_item(index)
        @items[index].toggle
    end

end