require_relative "player"
require_relative "board"

class Game
  def initialize
    @board = Board.new
    @player1 = Player.new("Player 1", "X")
    @player2 = Player.new("Player 2", "O")
    @current_player = @player1
  end

  # logic for play
  def play
    loop do
      @board.display
      puts "#{@current_player.name} (#{@current_player.symbol}), enter your move as row,col (0-2,0-2):"
      
      move = gets.chomp.split(",").map(&:to_i)

      if valid_move?(move) && @board.update(move, @current_player.symbol)
        if @board.check_winner
          @board.display
          puts "#{@current_player.name} wins! 🎉"
          break
        elsif @board.full?
          @board.display
          puts "It's a draw! 🤝"
          break
        end
        switch_turn
      else
        puts "Invalid move, try again!"
      end
    end
  end

  private

  def switch_turn
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def valid_move?(move)
    move.is_a?(Array) && move.size == 2 &&
      move.all? { |num| num.between?(0, 2) }
  end
end
