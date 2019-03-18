class GameBoard
  BOARD_SIZE = 10 # kích thước của lưới là 10 * 10
  HIDDEN_CELL = '⬜' # ô lưới khởi tạo(chưa biết bên dưới có mìn hay không)
  MINE = 'x' # dẫm vào mìn rồi em ơi
  TOTAL_CELLS = BOARD_SIZE * BOARD_SIZE # kích thước của lưới
  DIFFICULTY = 0.7 # xác xuất để 1 ô không phải là mìn

  attr_reader :visible_board, :mine_board
  def initialize
    @visible_board = generate_clean_grid
    @mine_board = generate_grid_with_mines @visible_board
  end
  # tạo mảng 2 chiều kích thước BOARD_SIZE * BOARD_SIZE với các phần tử có giá trị HIDDEN_CELL
  def generate_clean_grid
    Array.new(BOARD_SIZE) {Array.new(BOARD_SIZE, HIDDEN_CELL)}
  end
=begin
- hàm này dự vào phân bố xác xuất mìn chọn từ đầu vào
- Ex: chọn đầu vào 0.7 thì xác xuất để set_cell_status return về true là 0.3
- tức là lưới sẽ có khoảng 30% là mìn
=end
  def generate_grid_with_mines nested_array
    mine_array = nested_array.map do |array|
      array.map do |cell|
        set_cell_status(generate_random_number) ? MINE : HIDDEN_CELL
      end
    end
    mine_array
  end
  private
  # trả về 1 số ngẫu nhiên trong khoảng 1...TOTAL_CELLS
  def generate_random_number
    Random.new.rand(1...TOTAL_CELLS)
  end
  def set_cell_status random_number
    mine_cutoff_point = TOTAL_CELLS * DIFFICULTY
    random_number > mine_cutoff_point
  end
end
