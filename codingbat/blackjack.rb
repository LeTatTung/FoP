=begin
 - đầu vào:2 giá trị int lớn hơn 0
- đầu ra: trả về giá trị nào gần nhất với 21 mà không >21.
- Trả về 0 nếu cả hai cùng > 21

2.5.3 :019 >  blackjack(19, 21)
 => 21
2.5.3 :020 >  blackjack(21, 19)
 => 21
2.5.3 :021 >  blackjack(19, 22)
 => 19
2.5.3 :022 >  blackjack(19, 19)
 => 19
2.5.3 :023 >  blackjack(22, 19)
 => 19

=end
def blackjack a, b
  return 0 if (a > 21 && b > 21)
  if (a <= 21 && b <=21)
    return a if (a >= b)
    return b if (b > a)
  end
  return a if (a <=21 && b >21)
  return b if (a > 21 && b <= 21)
end
