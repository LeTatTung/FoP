=begin
- đầu vào là 2 mảng String raw và code_words
- hàm thay thế các từ trong `raw` bằng các từ trong` code_words`
- sao cho lần xuất hiện đầu tiên của mỗi từ trong` raw` được gán từ đầu tiên chưa được gán trong` code_words`

2.5.3 :092 >  encoder(["a", "b", "a"], ["1", "2", "3", "4"])
 => ["1", "2", "1"]
2.5.3 :093 > encoder(["a", "b"], ["1", "2", "3", "4"])
 => ["1", "2"]
2.5.3 :094 > encoder(["a"], ["1", "2", "3", "4"])
 => ["1"]
=end
def encoder raw, code_words
  output = []
  return output if (raw.length > code_words.length)
  for i in 0...raw.length
    exist = false
    for j in 0...i
      if (raw[i] == raw[j])
        output << code_words[j]
        exist = true
      end
    end
    output << code_words[i] if !exist
  end
  return output
end
