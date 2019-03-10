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
#### Cải tiến:
- sắp xếp các chuỗi W trong D theo độ dài trước rồi mới chạy step 1
- khi tìm được chuỗi con W của S thì lập tức break và trả về kết quả
####Độ phức tạp thuật toán: 
- 0(N*W), N là số ký tự trong S, W là số từ trong D
- Tốt nhất: các từ W trong D đều có độ dài N vì khi đó kích thước đầu vào là O(N*W)
- Dở nhất: S quá dài trong khi W quá ngắn 
