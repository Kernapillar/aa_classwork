require "byebug"
require_relative "item.rb"
require_relative "list.rb"

class TodoBoard

    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        begin
            puts "Enter a command"
            command = gets.chomp.downcase.split
            if command[0] == "mktodo" && command.length == 4
                @list.add_item(command[1], command[2], command[3])

            elsif command[0] == "mktodo"
                @list.add_item(command[1], command[2])

            elsif command[0] == "up" && command.length == 3
                @list.up(command[1].to_i, command[2].to_i)

            elsif command[0] == "up" 
                @list.up(command[1].to_i)

            elsif command[0] == "down" && command.length == 3
                @list.down(command[1].to_i, command[2].to_i)

            elsif command[0] == "down" 
                @list.down(command[1].to_i)

            elsif command[0] == "swap"
                @list.list_swap(command[1].to_i, command[2].to_i)

            elsif command[0] == "sort"
                @list.sort_by_date!

            elsif command[0] == "priority"
                @list.print_priority

            elsif command[0] == "print" && command.length > 1
                @list.print_full_item(command[1].to_i)

            elsif command[0] == "print"
                @list.print

            elsif command[0] == "quit" || command[0] == "exit"
                puts "quitting"
                return false

            else
                puts "invalid command, please try again"
                return true
            end
        rescue
            puts "ERROR please try again" 
            retry
        end
        true

    end

    def run
        running = true
        while running
            running = self.get_command
        end
    end

end

td = TodoBoard.new("test")
td.run