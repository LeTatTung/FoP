# Minesweeper
## Bài toán
- Minesweeper là một trò chơi trong đó mục tiêu được xác định chính xác vị trí 
của tất cả các quả mìn trong một lưới nhất định. 
- Bạn được cung cấp một lưới thống nhất các ô vuông màu xám vào đầu trò chơi. 
- Mỗi hình vuông chứa một quả mìn (được biểu thị bằng giá trị 9) hoặc hình vuông trống. 
- Các ô vuông trống có một số chỉ số lượng mìn trong các ô vuông liền kề. 
- Các ô vuông trống có thể có số đếm từ 0 (không có mìn liền kề) cho đến 8 (tất cả các ô vuông liền kề là mìn).
  
- Ví dụ, nếu bạn lấy một lưới hoàn chỉnh, bạn có thể thấy hình vuông nào có mìn và hình vuông nào trống:
``` sh
0  0  0  0  0
0  0  0  0  0
1  1  1  0  0
1  9  1  0  0
1  2  2  1  0
0  1  9  1  0
0  1  1  1  0
```
- Các hình vuông có giá trị "2" chỉ ra rằng có 2 quả mìn liền kề với hình vuông đó.
- Trò chơi bắt đầu khi người dùng bỏ ẩn một hình vuông một cách ngẫu nhiên. 
Nếu hình vuông chứa một quả mìn, trò chơi kết thúc. 
Nếu nó là một khoảng trống, số lượng các quả mìn liền kề được tiết lộ.

- Hiển thị số 0 có nghĩa là không có mì liền kề, vì vậy việc hiển thị tất cả các ô vuông liền kề được đảm bảo an toàn. 
Để thuận tiện cho người chơi, trò chơi tiếp tục để lộ các ô vuông liền kề cho đến khi đạt được một hình vuông khác 0.

Ví dụ: nếu bạn nhấp vào góc trên bên phải, bạn sẽ nhận được điều này ('-' có nghĩa là ẩn):
``` sh
0  0  0  0  0
0  0  0  0  0
1  1  1  0  0
-  -  1  0  0
-  -  2  1  0
-  -  -  1  0
-  -  -  1  0
```
- Viết cách hàm để xây dựng sân chơi và số lượng mìn được cài đặt từ đầu vào
## Cách giải
- Nếu bạn xây dựng lưới với kích thước N*N và có M quả mìn trong lưới:
    
    1) nếu M <NxN / 2 thì chọn ngẫu nhiên các điểm và nếu ô được chọn trống.
    Tệ nhất, cơ hội chọn phải 1 quả mìn thay vì ô trống là 50% nên 
    chúng ta cần 2 lần thử.
    2) nếu M> NxN / 2 thử bước 1 giả sử rằng tất cả các ô được khai thác 
    và chúng tôi đang cố gắng giải phóng các điểm (NxN - M). 
    Vì vậy, trong ví dụ cực đoan ở trên, phải mất gần một lần thử

- Một phần quan trọng của câu hỏi này là tìm ra cách đặt mìn. 
Việc thực hiện ngây thơ nhất là chọn hai số ngẫu nhiên (hàng và cột) và đặt mìn ở đó, 
nhưng điều này sẽ khiến bảng có ít mìn hơn dự kiến nếu cùng một tọa độ được chọn hai lần. 
- Thử lại nếu tọa độ đã chọn đã có mìn khắc phục sự cố ngay lập tức, 
nhưng sẽ mất một thời gian rất dài đối với các trường hợp như bảng 100x100 với 9999 quả mìn.

### Giải pháp đặt mìn
- Ý tưởng là điều chỉnh xác suất đặt mìn khi chúng ta lặp lại trên lưới.
``` sh
remaining_mines = M 
remaining_cells = N 
for i in range(0, N): 
  chance = float(remaining_mines) / remaining_cels 
  if random.uniform(0., 1.) < chance: 
    place_mine(i) 
    remaining_mines -= 1 
  remaining_cells -= 1
```
