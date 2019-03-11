=begin
tìm khoảng cách lớn nhất giữa 2 phần từ giống nhau trong mảng
2.5.3 :040 > max_span([1, 4, 2, 1, 4, 1, 4])
 => 6
2.5.3 :041 > max_span([1, 2, 1, 1, 3])
 => 4
=end

def max_span nums
  max = 0
  for i in 0...(nums.length) do
    index = nums.length - 1
    while(nums[i] != nums[index]) do
     index = index - 1
    end
    span = index - i + 1
    if span > max
      max = span
    end
  end
  return max
end
