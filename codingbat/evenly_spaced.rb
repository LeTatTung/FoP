=begin
- Cho ba số nguyên a, b c,
- một trong số chúng là nhỏ, trung bình và lớn.
- Trả về true nếu ba giá trị cách đều nhau(sự sai khác giữa nhỏ và trung bình = giữa trung bình và lớn)

2.5.3 :042 > evenly_spaced(2, 4, 6)
 => true
2.5.3 :043 > evenly_spaced(4, 6, 2)
 => true
2.5.3 :044 > evenly_spaced(4, 6, 3)
 => false

=end
def evenly_spaced a, b, c
  result = false
  if (a + b +c) % 3 == 0
    average = (a + b +c)/3
    x1 = a - average
    x2 = b - average
    x3 = c - average
    result = true if (x1 +x2 + x3 == 0)
  end
  return result
end
