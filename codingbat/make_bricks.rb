=begin
- Có một số viên gạch nhỏ (mỗi viên 1 inch) và những viên gạch lớn (mỗi viên 5 inch).
- Trả về giá trị true nếu có thể thực hiện mục tiêu bằng cách chọn từ các khối đã cho.

2.5.3 :081 > make_bricks? 3, 1, 8
 => true
2.5.3 :082 > make_bricks? 3, 1, 9
 => false
2.5.3 :083 > make_bricks? 3, 2, 10
 => true

=end
def make_bricks? small, big, goal
  result = goal >= (5 * big) ? goal - (5 * big) : goal % 5;
  return small >= result
end
