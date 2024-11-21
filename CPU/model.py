import numpy as np
import random

# Hàm tạo ma trận Q dựa trên values_map (r_ij) và pi_map (π)
def create_table_Q(values_map, pi_map):
    print("Ma trận tốc độ biến đổi")
    table_Q = []
    for i in ["A", "C", "G", "T"]:  # Duyệt qua từng nucleotide nguồn
        row = []
        row_sum = 0  # Tổng của hàng (dùng để tính đường chéo)
        for j in ["A", "C", "G", "T"]:  # Duyệt qua từng nucleotide đích
            if i == j:
                row.append("")  # Để trống giá trị trên đường chéo
            elif (i, j) in values_map:
                value = round(values_map[(i, j)] * pi_map[j], 2)  # Q_ij = r_ij * π_j
                row.append(value)
                row_sum += value
            elif (j, i) in values_map:  # Đối xứng: dùng giá trị từ (j, i) nếu (i, j) không có
                value = round(values_map[(j, i)] * pi_map[j], 2)
                row.append(value)
                row_sum += value
        row[row.index("")] = -row_sum  # Giá trị đường chéo Q_ii = -Σ(row)
        table_Q.append(row)  # Thêm hàng vào ma trận
    print(table_Q)  # In ma trận Q
    return table_Q

# Hàm tạo ma trận P từ Q và chiều dài nhánh
def create_table_P(table_Q, branch_length):
    print("Ma trận tỷ lệ biến đổi")
    table_P = []
    for row in table_Q:  # Duyệt qua từng hàng của ma trận Q
        row_P = []
        for element in row:  # Duyệt qua từng phần tử của hàng
            row_P.append(np.exp(element * branch_length))  # P_ij = exp(Q_ij * branch_length)
        table_P.append(row_P)  # Thêm hàng vào ma trận P
    print(table_P)  # In ma trận P
    return table_P

# ------------------------- Phần chính -------------------------

# Khởi tạo values_map (r_ij giữa các cặp nucleotide)
values_map = {
    ('A', 'C'): None,
    ('A', 'G'): None,
    ('A', 'T'): None,
    ('C', 'G'): None,
    ('C', 'T'): None,
    ('G', 'T'): None,
}

# Khởi tạo pi_map (tần số π của từng nucleotide)
pi_map = {'A': None, 'C': None, 'G': None, 'T': None}

# Yêu cầu người dùng nhập giá trị r_ij
for pair in values_map.keys():
    value = float(input(f"Nhập giá trị cho {pair}: "))
    values_map[pair] = value

# Yêu cầu người dùng nhập giá trị π
for nucleotide in pi_map.keys():
    pi_value = float(input(f"Nhập giá trị cho {nucleotide}: "))
    pi_map[nucleotide] = pi_value

# Sinh chuỗi tổ tiên ngẫu nhiên dựa trên π
random_ancestral = ''.join(random.choices(list(pi_map.keys()), weights=pi_map.values(), k=16))
print("Chuỗi tổ tiên: ", random_ancestral)

# Tạo ma trận Q
table_Q = create_table_Q(values_map, pi_map)

# Yêu cầu người dùng nhập chiều dài nhánh
branch_length = float(input(f"Nhập giá trị cho độ dài nhánh: "))

# Tạo ma trận P từ ma trận Q và chiều dài nhánh
table_P = create_table_P(table_Q, branch_length)
