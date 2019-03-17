=begin
- đầu vào là 1 string
- xoá bỏ các ký tự giống nhau trong string và giữ lại 1 ký tự đó

2.5.3 :072 > collapse_duplicates "a"
 => "a"
2.5.3 :073 >  collapse_duplicates "abc"
 => "abc"
2.5.3 :074 >  collapse_duplicates "abac"
 => "abc"
2.5.3 :075 >  collapse_duplicates "ababcc"
 => "abc"

=end

def collapse_duplicates str
  for i in 0...str.length
    for j in (i +1)...str.length
      str.slice!(j) if (str[i] == str[j])
    end
  end
  return str
end
