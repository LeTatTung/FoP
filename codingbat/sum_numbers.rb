=begin
hàm check xem 1 ký tư có phải là 1 chữ số
2.5.3 :210 > numeric?('7')
 => 0
2.5.3 :211 > numeric?('a')
 => nil
=end
def numeric?(lookAhead)
  lookAhead =~ /[0-9]/
end

=begin
hàm check xem 1 ký tự có phải là 1 chữ cái
2.5.3 :216 > letter?('a')
 => 0
2.5.3 :217 > letter?('5')
 => nil
=end
def letter?(lookAhead)
  lookAhead =~ /[A-Za-z]/
end

=begin
trả về vị trí đầu tiên của chữ số trong xâu đầu vào
2.5.3 :235 > numeric_index("ab123")
 => 2
2.5.3 :236 > numeric_index("abc123")
 => 3
=end
def numeric_index str, index
  length = str.length
  while(index < length && !numeric?(str[index])) do
    index = index + 1
  end
  return index
end

def sum_numbers str
  sum = 0
  i = numeric_index(str,0)
  b = i
  e = i
  while (i < str.length) do
    if !numeric?(str[i])
      sum = sum + Integer(str[b...e])
      i = numeric_index(str, (i +1))
      b = i
      e = i
    else
      e = e + 1
      i = i + 1
    end
  end
  if (e > b)
    sum = sum + Integer(str[b..e])
  end
  return sum
end
