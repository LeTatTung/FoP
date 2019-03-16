=begin
- hàm nhận đầu vào là 1 mảng các String
- trả về Map<String, String> với key là ký tự đầu tiên của từng String trong mảng đầu vào
- value là ký tự cuối cùng của String đó

2.5.3 :024 > pairs_problem ["code", "bug"]
 => {"c"=>"e", "b"=>"g"}
2.5.3 :025 > ["man", "moon", "main"]
 => ["man", "moon", "main"]
2.5.3 :026 > pairs_problem ["man", "moon", "main"]
 => {"m"=>"n"}
2.5.3 :027 > pairs_problem ["man", "moon", "good", "night"]
 => {"m"=>"n", "g"=>"d", "n"=>"t"}

=end

def pairs_problem arr
  hash_output = {}
  for i in 0...arr.length do
    string_length = arr[i].length
    key = arr[i][0]
    value = arr[i][string_length -1]
    hash_output.store(key, value)
  end
  return hash_output
end
