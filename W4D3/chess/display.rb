require "colorize"
require_relative "cursor"
require_relative "board" 
require "byebug"

class Display
    attr_reader :board, :cursor
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
        @selected = false
        @inputs = []
        @selected_piece = board[[1,0]]
    end

    def render
        (0..7).each do |i|
            (0..7).each do |j|
                if [i,j] == cursor.cursor_pos && @selected 
                print  " #{board[[i,j]].symbol} ".colorize(:background => :light_blue)
                @selected_piece = board[[i, j]]
                elsif [i,j] == cursor.cursor_pos
                    print  " #{board[[i,j]].symbol} ".colorize(:background => :yellow)
                elsif [i,j] == @selected_piece.current_pos || @selected_piece.move_dir.include?([i,j])
                    print  " #{board[[i,j]].symbol} ".colorize(:background => :red)
                elsif (i % 2 == 0 && j % 2 == 0) || (i % 2 != 0 && j % 2 != 0)
                    print  " #{board[[i,j]].symbol} ".colorize(:background => :green)
                else
                    print " #{board[[i,j]].symbol} ".colorize(:background => :magenta)
                end
            end
            puts 
        end
    end

    def cursor_updater
        @inputs = []
        while true
            system("clear")
            render
            input = @cursor.get_input
            toggle_selected(input)
            @inputs << input if input != nil
            if @inputs.length == 2    
                board.move_piece(@inputs[0], @inputs[1])
                @inputs = []
            end
            system("clear")
            render
        end
    rescue
        @inputs = []
        retry
    end

    def toggle_selected(input)
        if input == nil
            @selected = false
        else
            @selected = true
        end  
    end
end