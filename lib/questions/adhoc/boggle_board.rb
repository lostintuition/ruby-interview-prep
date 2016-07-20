#! /usr/bin/env ruby

class BoggleBoard
  def initialize()
    @board = Array.new
    row1 = ["G", "I", "Z"]
    row2 = ["U", "E", "K"]
    row3 = ["Q", "S", "E"]
    @board.push(row1)
    @board.push(row2)
    @board.push(row3)

    @words = ["QUIZ", "GEEK", "GEEKS"]
  end

  def print_all_words()
    visited = generate_visited_matrix
    @board.each_index do |i|
      row = @board[i]
      row.each_index do |j|
        find_word(i, j, [], visited)
      end
    end
  end

  def find_word(i, j, str, visited)
    visited[i][j] = true
    str.push(@board[i][j])

    if @words.include?(str.join)
      puts str.join
    end

    get_adjacent_cells(i, j).each do |adjacent_cell|
      next if visited[adjacent_cell[:i]][adjacent_cell[:j]]
      find_word(adjacent_cell[:i], adjacent_cell[:j], str, visited)
    end

    visited[i][j] = false
    str.pop
  end

  def generate_visited_matrix()
    visited_matrix = Array.new
    @board.length.times do |i|
      row = Array.new
      @board.length.times do |j|
        row.push(false)
      end
      visited_matrix.push(row)
    end
    visited_matrix
  end

  def get_adjacent_cells(i, j)
    rows = [i - 1, i, i + 1]
    columns = [j - 1, j, j + 1]
    adjacent_cells = Array.new

    rows.each do |row|
      columns.each do |column|
        next if column < 0 || row < 0
        next if column >= @board.length || row >= @board.length
        next if row == i && column == j
        adjacent_cells.push({ i: row, j: column })
      end
    end
    adjacent_cells
  end
end
