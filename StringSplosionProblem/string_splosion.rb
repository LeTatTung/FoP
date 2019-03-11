=begin
Given a non-empty string like "Code" return a string like "CCoCodCode".
stringSplosion("Code") → "CCoCodCode"
stringSplosion("abc") → "aababc"
stringSplosion("ab") → "aab"
=end

def stringSplosion input
  output = input
  length = input.length
  while(length > 0) do
    temp = input[0, length -1]
    output = "#{temp}#{output}"
    length = length - 1
  end
  return output
end
