require_relative 'game_board'
require_relative 'coordinates'

class Game
  attr_reader :game_board
  attr_accessor :game_lost

  def initialize
    @game_board = GameBoard.new
    @game_lost = false
    @empty_cells = []
  end

  def lost?
    @game_lost
  end

  # người chơi thắng khi số ô chưa mở bằng số mìn trong lưới
  def won?
    untouched_cells = @game_board.visible_board.flatten.count(GameBoard::HIDDEN_CELL)
    number_of_mines = @game_board.mine_board.flatten.count(GameBoard::MINE)
    untouched_cells == number_of_mines
  end
  def in_process?
    !(lost? || won?)
  end

  # kiểm tra đầu vào nhận từ người dùng
  def guess_valid? input
    number?(input) && number_in_range?(input)
  end
  #  check 1 vị trí bất kỳ xem chỗ đó có mìn hay không
  def mine? guess
    coordinates = axis_adjusted_coordinates guess
    @game_board.mine_board[coordinates.y][coordinates.x] == GameBoard::MINE
  end

  def reveal_guess guess, board
    coordinates = axis_adjusted_coordinates guess
    number = number_of_surrounding_mines coordinates
    if mine? guess
      board[coordinates.y][coordinates.x] = GameBoard::MINE
    elsif number == 0
      board[coordinates.y][coordinates.x] = GameBoard::EMPTY_CELL
      @empty_cells.push(coordinates)
      show_empty_neighbours(coordinates)
    else
      board[coordinates.y][coordinates.x] = number
    end
  end

  private
  # check xem string đầu vào có phải là số không
  def number? input
    input.to_i != 0
  end

  #check xem số user nhập vào có nằm trong phạm vi cho phép của lưới ko
  def number_in_range? input
    input.to_i.between?(1..GameBoard::BOARD_SIZE)
  end

  # chú ý là hệ toạ độ tính từ dưới lên trên, từ trái qua phải
  # trả về điểm trong hệ toạ độ trên lưới
  def axis_adjusted_coordinates guess
    value_x = guess.x - 1
    value_y = GameBoard::BOARD_SIZE - (guess.y)
    return CoordinatePair.new(value_x, value_y)
  end

  def number_of_surrounding_mines guess
    cell_coords = get_surrounding_cell_coords guess
    cell_value = get_surrounding_cell_values cell_coords
    cell_value.count(GameBoard::MINE)
  end

  #lấy giá trị của các ô xung quanh
  def get_surrounding_cell_values array_of_cell_coords
    cell_values = []
    array_of_cell_coords.each do |cell|
      cell_values.push(@game_board.mine_board[cell.y][cell.x])
    end
    return cell_values
  end

  #lấy các ô xung quanh (phụ thuộc vào vị trí của ô đó để lấy data)
  def get_surrounding_cell_coords coordinates
    surrounding_cell_coords = []
    # ô bên trái
    surrounding_cell_coords.push(CoordinatePair.new(coordinates.x -1, coordinates.y)) if coordinates.x >= 1
    # ô bên phải
    surrounding_cell_coords.push(CoordinatePair.new(coordinates.x +1, coordinates.y)) if coordinates.x < GameBoard::BOARD_SIZE - 1
    # ô bên trên
    surrounding_cell_coords.push(CoordinatePair.new(coordinates.x, coordinates.y -  1)) if coordinates.y >= 1
    # ô bên dưới
    surrounding_cell_coords.push(CoordinatePair.new(coordinates.x, coordinates.y + 1)) if coordinates.y < GameBoard::BOARD_SIZE - 1
    # ô bên trên trái
    surrounding_cell_coords.push(CoordinatePair.new(coordinates.x - 1, coordinates.y - 1)) if coordinates.x >= 1 && coordinates.y >= 1
    # ô bên trên phải
    surrounding_cell_coords.push(CoordinatePair.new(coordinates.x + 1, coordinates.y - 1)) if coordinates.x < GameBoard::BOARD_SIZE - 1 && coordinates.y >= 1
    # ô bên dưới trái
    surrounding_cell_coords.push(CoordinatePair.new(coordinates.x - 1, coordinates.y + 1)) if coordinates.x >= 1 && coordinates.y < GameBoard::BOARD_SIZE - 1
    # ô bên dưới phải
    surrounding_cell_coords.push(CoordinatePair.new(coordinates.x + 1, coordinates.y + 1)) if coordinates.x < GameBoard::BOARD_SIZE - 1 && coordinates.y < GameBoard::BOARD_SIZE - 1
    return surrounding_cell_coords
  end

  def show_empty_neighbours cell
    neighbour_cells = get_surrounding_cell_values cell
    neighbour_cells.each do |n_cell|
      if @empty_cells.include?(n_cell)
        next
      end
      reveal_neighbours_on_board n_cell
    end
  end

  #hiển thị ô hàng xóm
  def reveal_neighbours_on_board cell
    cell_value = number_of_surrounding_mines cell #tính giá trị của ô này
    if cell_value == 0
      #nếu giá trị ô này = 0 thì add nó vào array các ô trống và show hàng xóm nó ra
      @empty_cells.push(cell)
      @game_board.visible_board[cell.y][cell.x] = GameBoard::EMPTY_CELL
      show_empty_neighbours cell
    else
      #nếu không thì hiển thị giá trị của nó ra
      @game_board.visible_board[cell.y][cell.x] = cell_value
    end
  end
end
