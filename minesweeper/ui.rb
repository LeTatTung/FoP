require_relative 'game_board'

class UI
  def initialize game
    @game = game
  end
  def board_layout
    [
        "   ↑",
        "10 |",
        " 9 |",
        " 8 |",
        " 7 |",
        " 6 |",
        " 5 |",
        " 4 |",
        " 3 |",
        " 2 |",
        " 1 |",
        "   + ― ― ― ― ― ― ― ― ― ― →",
        "     1 2 3 4 5 6 7 8 9 10"
    ]
  end
  def print_welcome_message
    puts "Chào mừng anh em đến với trò chơi dẫm mìn"
  end

  def print_game_play_instructions
    puts "Đây là mô hình vị trí các ô của game"
    puts board_layout.map {|element| element + "\n"}
  end

  def format_board board_as_nested_array
    board_as_nested_array.map do |row|
      row.join(" ") + "\n"
    end
  end

  def draw_board board
    puts "Đây là lưới:"
    puts format_board(board)
  end

  def show_flags_on_winning_board board
    flag_mines_board = board.map do |array|
      array.map do |cell|
        if cell == GameBoard::HIDDEN_CELL
          cell = GameBoard::GameBoard::MINE_FLAG
        else
          cell
        end
      end
    end
    return flag_mines_board
  end

  def prompt_user_guess coordinate
    puts "Nhập giá trị #{coordinate} nằm trong khoảng 1-#{GameBoard::BOARD_SIZE}"
    gets.chomp.to_i
  end

  def print_wrong_input_message
    puts "Mời sếp nhập lại giá trị trong khoảng 1-#{GameBoard::BOARD_SIZE}"
  end

  def clear_screen
    system("clear")
  end

  def print_mine_message
    puts "Nổ chết cmnr!!!"
  end

  def print_game_over_message
    puts "GAME OVER"
  end

  def print_win_message
    puts "Congrats! You won the game!"
  end
end
