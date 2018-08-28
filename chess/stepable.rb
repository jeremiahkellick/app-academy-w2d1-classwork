require_relative "add_pos"

module Stepable
  def moves
    result = []
    moves_diffs.each do |diff|
      new_pos =  add_pos(@add_pos)
      if @board.valid_pos?(new_pos) && @board[new_pos].color != @color
        result << new_pos
      end
    end
    result
  end

  def moves_diffs
    raise NotImplmentedError
  end
end

class King < Piece
  include Stepable
  def move_diffs
    [[1,0], [0,-1], [-1,0], [0,1], [1,-1], [-1,-1], [-1,1], [1,1]]
  end
end

class Knight < Piece
  include Stepable
  def move_diffs
    [[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2],[1,2],[2,1]]
  end
end
