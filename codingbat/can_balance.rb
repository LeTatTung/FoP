=begin
viết chương trình check xem 1 mảng số nguyên(khác rỗng)có tồn tại 1 ví trí
mà tổn các số từ vị trí đó trở về trước bằng tổng các số sau vị trí đó
- nêu có thì đó được gọi là vị trị cân bằng của mảng

2.5.3 :400 > can_balance([1, 1, 1, 2, 1])
 => true
2.5.3 :401 > can_balance([1, 1])
 => true
2.5.3 :402 > can_balance([1])
 => false

=end
def can_balance nums
  length = nums.length
  i = 0
  result = false
  while (i < length) do
    sum_before = 0
    sum_after = 0
    for j in 0..i do
      sum_before = sum_before + nums[j]
    end
    for j in (i+1)...length do
      sum_after = sum_after + nums[j]
    end
    if (sum_before == sum_after)
      result = true
      return result
    else
      i = i + 1
    end
  end
  return result
end
