require_relative 'tic_tac_toe_node'
require 'byebug'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node_daddy = TicTacToeNode.new(game.board, mark)
    node_daddy.children.each do |boi_gorl|
      # debugger
      if boi_gorl.winning_node?(mark)
        return boi_gorl.prev_move_pos
      end
    end

    node_daddy.children.each do |boi_gorl|
      if !boi_gorl.losing_node?(mark)
        return boi_gorl.prev_move_pos
      end
    end

    raise "pew pew"

  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
