S = "abppplee"
D = ["able", "ale", "apple", "bale", "kangaroo"]

# trả về xâu chung dài nhất của 2 xâu dầu vào(Longest common subsequence)
=begin
irb(main):001:0> lcs('thisisatest', 'testing123testing')
=> "tsitest"
=end
def lcs(xstr, ystr)
  return "" if xstr.empty? || ystr.empty?

  x, xs, y, ys = xstr[0..0], xstr[1..-1], ystr[0..0], ystr[1..-1]
  if x == y
    x + lcs(xs, ys)
  else
    [lcs(xstr, ys), lcs(xs, ystr)].max_by {|x| x.size}
  end
end

=begin
2.5.3 :058 > greedy_algo(D, S)
 => "apple"
=end
def lcs_array array,s
  # sắp xếp mảng D theo thứ tự độ dài giảm dần
  x = []
  sort = array.sort_by{ |word| -word.length }
  for i in 0...(sort.size) do
    x.push(lcs(sort[i], s))
  end
  out_array = x.sort_by{ |word| -word.length }
  return out_array[0]
end

# kiểm tra s1 có phải là xâu con của s2
=begin
2.5.3 :083 > subsequence?("ale", "appple")
 => true
=end
def subsequence?(xstr, ystr)
  result = false
  x, xs, y, ys = xstr[0..0], xstr[1..-1], ystr[0..0], ystr[1..-1]
  out = if x == y
    x + lcs(xs, ys)
  else
    [lcs(xstr, ys), lcs(xs, ystr)].max_by {|x| x.size}
  end
  result = true if out == xstr
  return result
end

=begin
2.5.3 :097 > greedy_algo(D, S)
 => "apple"
=end
def greedy_algo array, s
  sort = array.sort_by{ |word| -word.length }
  for i in 0...(sort.length) do
    return sort[i] if subsequence?(sort[i], s)
  end
end
