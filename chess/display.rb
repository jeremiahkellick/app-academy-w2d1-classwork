require "colorize"
require_relative "cursor"
require_relative "board"

class Display
  attr_reader :cursor
  attr_accessor :highlighted

  def initialize(board)
    @board = board
    @cursor = Cursor.new([6, 3], board)
    @highlighted = []
  end

  def render
    string = ""
    black = false
    (8).times do |i|
      black = !black
      (8 * 2).times do |j|
        pos = [i, j / 2]
        piece = @board[pos]
        black = !black if j % 2 == 0
        bg = black ? :black : :light_black
        bg = :blue if @highlighted.include?(pos)
        bg = :red if pos == @cursor.cursor_pos
        if j % 2 == 0
          color = piece.color == :white ? :white : :magenta
          string << piece.to_s.colorize(color: color, background: bg)
        else
          string << " ".colorize(background: bg)
        end
      end
      string << " \n".colorize(background: :default)
    end
    system("clear")
    print string
  end
end
