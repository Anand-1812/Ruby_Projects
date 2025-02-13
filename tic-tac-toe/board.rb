class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, " ") }
  end

  def display
    puts "\n"
    @grid.each_with_index do |row, i|
      puts row.join(" | ")
      puts "--+---+--" unless i == 2
    end
    puts "\n"
  end

  def update(position, symbol)
    row, col = position
    if @grid[row][col] == " "
      @grid[row][col] = symbol
      return true
    end
    false
  end

  def check_winner
    lines = @grid + @grid.transpose + diagonals
    lines.each do |line|
      return true if line.all? { |cell| cell == "X" }
      return true if line.all? { |cell| cell == "O" }
    end
    false
  end

  def full?
    @grid.flatten.none? { |cell| cell == " " }
  end

  private

  def diagonals
    [[@grid[0][0], @grid[1][1], @grid[2][2]], [@grid[0][2], @grid[1][1], @grid[2][0]]]
  end
end
