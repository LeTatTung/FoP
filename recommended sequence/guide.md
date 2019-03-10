## Bài toán
- Cho một xâu S và một tập hợp các từ D, tìm từ dài nhất trong D là một xâu con của S.
- Một xâu W là xâu con của S khi xoá đi x ký tự từ xâu S (x có thể = 0) để tạo thành W mà không đổi vị trí của các ký tự còn lại trong xâu.
- Lưu ý: D có thể xuất hiện ở bất kỳ định dạng nào (danh sách, bảng băm, cây tiền tố, v.v.

Ví dụ: với input S = "abppplee" và D = {"able", "ale", "apple", "bale", "kangaroo"}, output chính xác sẽ là "apple"

- Các từ "able" và "ale" đều là các từ sau của S, nhưng chúng ngắn hơn "apple".
- Từ "bale" không phải là xâu con của S bởi vì mặc dù so với S, nó chứa tất cả các chữ cái đúng, nhhuwng thứ tự các chữ cái không theo đúng thứ tự.
- Từ "kangaroo" là từ dài nhất trong D, nhưng nó không phải là một xâu con của S.

## Cách giải
### Thuật toán vét cạn (greedy algorithm)
#### Các bước thực hiện
- Step 1: Quét toàn bộ các chữ cái trong W, bắt đầu từ W[0], W[1] ...và so sánh với S, nếu bạn thấy toàn bộ các kí tự trong W 
nằm trong S thì W là xâu con của S
- Step 2: Sắp xếp lại các xâu con W tìm được trong D theo độ dài và đưa ra kết quả
#### Cải tiến lần 1:
- sắp xếp các chuỗi W trong D theo độ dài trước rồi mới chạy step 1
- khi tìm được chuỗi con W của S thì lập tức break và trả về kết quả
#### Độ phức tạp thuật toán: 
- 0(N*W), N là số ký tự trong S, W là số từ trong D
- Tốt nhất: các từ W trong D đều có độ dài N vì khi đó kích thước đầu vào là O(N*W)
- Dở nhất: S quá dài trong khi W quá ngắn 

#### Cải tiến lần 2:
- Để kiểm tra 1 từ W trong D, chúng ta cần phải biết ký tự c trong W = S[i], với i > j(j là vị trí 2 ký tự của W và S giống nhau trước đó)
- Thuật toán vét cạn đã quét i luôn từ 0 đến j(khoảng cách không cần so sánh). Điều này khiến nó chạy chậm.
- Tiền xử lý S: xây dựng map chứa thông tin về các ký tự mà nó chứa.
##### Example
``` sh
a -> [0]
b -> [1]
p -> [2, 3, 4]
l -> [5]
e -> [6, 7]
```
  
- Khi bạn biết các ký tự phù hợp cuối cùng nằm ở vị trí X, ký tự cần so sánh tiếp theo là Y, bạn sẽ tìm kiếm Y trong map
ở vị trí > X
- Nếu không tìm thấy ký tự Y trong các vị trí > X, có thể dừng lại và trả về kết quả W không phải là xâu con của S
- Cách tiếp cận này yêu cầu một tìm kiếm nhị phân cho mỗi ký tự trong W. Vì chỉ mất thời gian O (N) để xử lý trước S
 theo cách này, nên tổng độ phức tạp là O (N + L * log N), khá gần với độ phức tạp tốt nhất có thể. 
 (L là tổng số ký tự của tất cả các từ trong D)

#### Đạt được độ phức tạp O(N + L)
- Thay vì xử lý từng từ 1,hãy xử lý tất cả các từ cùng 1 lúc.
- Với 1 từ W trong D, tạo 1 hash(key, value) theo kiểu (w, i) trong đó:
    + w là xâu cần so sánh
    + i - số lượng ký tự trong w khớp với S, ban đầu khởi tạo nên i = 0
- Nhóm các từ w trong D theo w[i], vì ban đầu i = 0 có nghĩa là nhóm theo ký tự đầu tiên của w
- Với D theo đầu bài ta có nhóm:
``` sh
a -> [("able", 0), ("ale", 0), ("apple", 0)]
b -> [("bale", 0)]
k -> [("kangaroo", 0)]
```
- Thông qua i chúng ta sẽ biết được vị trí ký tự tiếp theo được duyệt trong S, do sánh c(kí tự được duyệt đến trong S) với W[i] 
- Duyệt lần lượt từng ký tự trong S, cập nhật các nhóm theo i.
- S[0] = 'a': (S ="abpple"")
``` sh
a -> [("able", 1), ("ale", 1), ("apple", 1)]
b -> [("bale", 0)]
k -> [("kangaroo", 0)]
```
- S[1] = 'b':
``` sh
a -> [("able", 2), ("alea", 1), ("apple", 1)]
b -> [("bale", 1)]
k -> [("kangaroo", 0)]
```
- S[2] = 'p':
``` sh
a -> [("able", 2), ("alea", 1), ("apple", 2)]
b -> [("bale", 1)]
k -> [("kangaroo", 0)]
```
- S[3] = 'p'
``` sh
a -> [("able", 2), ("alea", 1), ("apple", 3)]
b -> [("bale", 1)]
k -> [("kangaroo", 0)]
```
- S[4] = 'l'
``` sh
a -> [("able", 3), ("alea", 2), ("apple", 4)]
b -> [("bale", 1)]
k -> [("kangaroo", 0)]
```
- S[5] = 'e'
``` sh
a -> [("able", 4), ("alea", 2), ("apple", 5)]
b -> [("bale", 1)]
k -> [("kangaroo", 0)]
```
- Kết thúc duyệt S, tìm các hash mà có hash(key).length = hash(value) cho vào 1 nhóm gọi là nhóm xâu con của S.
- Trả về w có value (xâu dài nhất) trong nhóm này.