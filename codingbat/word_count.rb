=begin
- đầu vào là 1 array các string
- đầu ra là Map<String, Integer> với key là String trong mảng đầu vào
- value là số lần xuất hiện của String đó trong mảng

2.5.3 :171 > word_count ["a", "b", "a", "c", "b"]
 => {"a"=>2, "b"=>2, "c"=>1}
2.5.3 :172 > word_count ["c", "b", "a"]
 => {"c"=>1, "b"=>1, "a"=>1}
2.5.3 :173 > word_count ["c", "c", "c", "c"]
 => {"c"=>4}
=end
def word_count arr
  output = {}
  for i in 0...arr.length do
    value = output["#{arr[i]}"]
    if( value == nil)
      output.store(arr[i], 1)
    else
      value = value + 1
      output.store(arr[i], value)
    end
  end
  return output
end
