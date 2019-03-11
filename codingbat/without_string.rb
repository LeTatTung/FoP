=begin
đầu vào là 2 string s1, s2
xoá tất cả các chỗ s2 trong s1
chú ý là phân biệt hoa thường

2.5.3 :205 > without_string("THIS is a FISH", "is")
 => "THIS  a FISH"
2.5.3 :206 >  without_string("This is a FISH", "IS")
 => "This is a FH"

=end
def without_string base, remove
  base_length = base.length
  remove_length = remove.length
  output = ""
  i = 0
  while(i <= base_length - remove_length + 1) do
    if base[i...(i + remove_length )] == remove
      i = i + remove_length
    else
      output << base[i]
      i = i + 1
    end
  end
  return output
end
