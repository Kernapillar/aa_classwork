require 'byebug'
require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def inspect
    "<check: #{next_mover_mark}, id: #{object_id}"
  end

  def losing_node?(evaluator)
    return false if board.over? && board.winner == nil || board.winner == evaluator
    return true if board.over? && board.winner != evaluator

    if next_mover_mark == evaluator
      # debugger
      children.all? { |child| child.losing_node?(evaluator) } 
      
    else
      children.any? { |child| child.losing_node?(evaluator) } 
    end
  end

  def winning_node?(evaluator)
    return false if board.over? && (board.winner == nil || board.winner != evaluator)
  
    return true if board.over? && board.winner == evaluator
    
    if next_mover_mark == evaluator
      
      children.any? { |child| child.winning_node?(evaluator) } 
      
    else
      children.all? { |child| child.winning_node?(evaluator) } 
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    nodes = []
    board.rows.each_with_index do |row, row_i|
      row.each_with_index do |val, col_i|
        if board.empty?([row_i, col_i])
          if next_mover_mark == :x
            next_mark = :o
          else
            next_mark = :x
          end

          pos = [row_i, col_i]
          new_board = board.dup
          new_board[pos] = next_mover_mark

          nodes << TicTacToeNode.new(new_board, next_mark, [row_i, col_i])
        end
      end
    end
    nodes
  end
end
