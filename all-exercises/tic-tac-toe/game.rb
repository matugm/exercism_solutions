
class TicTacToe
  attr_reader :board

  def initialize
    @board = [[], [], []]
  end

  def move(piece, x, y)
    @board[x][y] = piece
  end

  def winner
    horizontal_win || !!vertical_win
  end

  private

  def horizontal_win
    @board.any? do |row|
      row[0] == row[1] && row[1] == row[2] && row.size > 0
    end
  end

  def vertical_win
    @board[0][0] && @board[1][0] && @board[2][0] ||
    @board[0][1] && @board[1][1] && @board[2][1] ||
    @board[0][2] && @board[1][2] && @board[2][2]
  end
end
