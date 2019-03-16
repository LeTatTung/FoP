=begin
hàm nhận đầu vào là 1 mảng
xoá các phần tử có giá trị giống nhau vào chỉ để lại 1 phần tử duy nhất có giá trị đó

2.5.3 :032 >  remove_same_element ["a", "bb", "a", "bb"]
 => ["a", "bb"]
2.5.3 :033 >  remove_same_element ["a", "b", "a", "c", "b"]
 => ["a", "b", "c"]
2.5.3 :034 > remove_same_element ["c", "b", "a"]
 => ["c", "b", "a"]

=end
def remove_same_element arr
  i = 0
  while(i < arr.length) do
    for j in (i+1)...arr.length do
      if arr[i] == arr[j]
        arr.slice!(j)
      end
    end
    i = i + 1
  end
  return arr
end

=begin
- nhận đầu vào là 1 mảng
- nếu có các giá trị trùng nhau thì chỉ giữ lại 1 giá trị duy nhất
- đầu ra là hash với key là string tồn tại duy nhất trong mảng, value là độ dài string

2.5.3 :076 > word_len ["code", "code", "code", "bug"]
 => {"code"=>4, "bug"=>3}
2.5.3 :077 > word_len ["this", "and", "that", "and"]
 => {"this"=>4, "and"=>3, "that"=>4}
2.5.3 :078 > word_len ["a", "bb", "a", "bb"]
 => {"a"=>1, "bb"=>2}

=end
def word_len arr
  output = {}
  remove_same_element arr
  i = 0
  while(i < arr.length) do
    output.store(arr[i], arr[i].length)
    i = i + 1
  end
  return output
end
