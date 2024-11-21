import numpy as np
import random

# Class đại diện cho mỗi node trong cây
class Node:
    def __init__(self, name_val, depth, table_Q):
        # Phân tách tên và giá trị branch length từ chuỗi đầu vào (dạng name:value)
        name, val_str = name_val[::-1].split(":")
        self.name = name  # Tên của node (A, B, C, ...)
        self.value = float(val_str)  # Branch length (chiều dài nhánh từ cha đến node này)
        self.depth = depth  # Độ sâu của node trong cây
        self.table_P = create_table_P(table_Q, self.value)  # Ma trận P dựa trên branch length
        self.children = []  # Danh sách các node con
        self.parent = None  # Node cha
        self.ancestral = None  # Chuỗi tổ tiên (nucleotide sequence)

    # Tính độ sâu của node bằng cách duyệt ngược lên cha
    def get_depth(self):
        current_node = self
        depth = 0
        while current_node.parent:  # Lặp lại cho đến khi đạt gốc
            current_node = current_node.parent
            depth += 1
        return depth

    # Chuỗi hiển thị node, bao gồm độ sâu, tổ tiên và ma trận P
    def __str__(self):
        temp = str(self.depth) + str(self.ancestral)
        for i in range(0, 4):
            for j in range(0, 4):
                temp = temp + str(self.table_P[i][j])
        return temp

# Lấy giá trị r_ij từ người dùng cho từng cặp nucleotide
def get_r():
    r_map = {
        ('A', 'C'): None,
        ('A', 'G'): None,
        ('A', 'T'): None,
        ('C', 'G'): None,
        ('C', 'T'): None,
        ('G', 'T'): None,
    }
    for pair in r_map.keys():
        value = float(input(f"Nhập giá trị cho {pair}: "))
        r_map[pair] = value
    return r_map

# Lấy giá trị π từ người dùng cho từng nucleotide
def get_pi():
    pi_map = {'A': None, 'C': None, 'G': None, 'T': None}
    for nucleotide in pi_map.keys():
        pi_value = float(input(f"Nhập giá trị cho {nucleotide}: "))
        pi_map[nucleotide] = pi_value
    return pi_map

# Tạo ma trận Q từ các giá trị r và π
def create_table_Q(values_map, pi_map):
    table_Q = []
    for i in ["A", "C", "G", "T"]:
        row = []
        row_sum = 0
        for j in ["A", "C", "G", "T"]:
            if i == j:
                row.append("")  # Để trống giá trị chéo
            elif (i, j) in values_map:
                # Giá trị Q = r_ij * π_j
                value = round(values_map[(i, j)] * pi_map[j], 2)
                row.append(value)
                row_sum += value
            elif (j, i) in values_map:  # Đối xứng
                value = round(values_map[(j, i)] * pi_map[j], 2)
                row.append(value)
                row_sum += value
        row[row.index("")] = -row_sum  # Giá trị đường chéo = -Σ(row)
        table_Q.append(row)
    return table_Q

# Tạo ma trận P từ Q và branch length
def create_table_P(table_Q, branch_length):
    table_P = []
    for row in table_Q:
        row_P = []
        for element in row:
            row_P.append(np.exp(element * branch_length))  # P = exp(Q * branch_length)
        table_P.append(row_P)
    return table_P

# Đọc cây Newick từ file
def read_newick_from_file(filename):
    with open(filename, 'r') as file:
        newick = file.read().strip()
    return newick[:-1]  # Loại bỏ dấu chấm phẩy cuối chuỗi

# Lấy tất cả các node tại một độ sâu cụ thể trong cây
def get_nodes_at_depth(root, target_depth):
    nodes_at_depth = []
    stack = [root]
    while stack:
        node = stack.pop()
        if node.get_depth() == target_depth:  # Nếu độ sâu khớp, thêm vào danh sách
            nodes_at_depth.append(node)
        stack.extend(node.children)  # Thêm node con vào stack
    return nodes_at_depth

# Tạo cây từ chuỗi Newick
def create_tree(newick, table_Q):
    root = None
    max_depth = 0
    na = ""  # Biến tạm chứa tên và giá trị branch length
    stack = []
    for i in list(reversed(newick)):
        if len(stack) > max_depth:
            max_depth = len(stack)  # Theo dõi độ sâu lớn nhất
        if i == ')':  # Bắt đầu một nhánh
            if na != "":
                node = Node(na, len(stack), table_Q)
                na = ""
                if len(stack):
                    stack[-1].children.append(node)
                    node.parent = stack[-1]  # Kết nối cha-con
                else:
                    root = node
                stack.append(node)
        elif i == '(':  # Kết thúc một nhánh
            if na != "":
                node = Node(na, len(stack), table_Q)
                na = ""
                stack[-1].children.append(node)
                node.parent = stack[-1]
            stack.pop()
        elif i == ',':  # Phân tách các node con
            if na != "":
                node = Node(na, len(stack), table_Q)
                na = ""
                stack[-1].children.append(node)
                node.parent = stack[-1]
        else:
            na += i  # Thu thập dữ liệu node
    return root, max_depth + 1

# ------------------------- Khởi tạo -------------------------

# Lấy giá trị r và π từ người dùng
r_map = get_r()
pi_map = get_pi()

# Sinh ngẫu nhiên chuỗi tổ tiên
random_ancestral = ''.join(random.choices(list(pi_map.keys()), weights=pi_map.values(), k=16))

# Tạo ma trận Q
table_Q = create_table_Q(r_map, pi_map)

# Đọc chuỗi Newick từ file
filename = r"G:\\Torture\\RESEARCH\\ADN_ARN\\Alisim_code\\CPU\\treefile.txt"
newick = read_newick_from_file(filename)
newick += ":0"  # Thêm branch length cho root

# Tạo cây từ Newick
root, max_depth = create_tree(newick, table_Q)

# Gán chuỗi tổ tiên ngẫu nhiên cho các node ở độ sâu 1
F1_node = get_nodes_at_depth(root, 1)
for node in F1_node:
    node.ancestral = random_ancestral

# Xuất dữ liệu cho các node ở độ sâu 1
data = ""
for node in F1_node:
    data = data + f"{node}"
print("Chuỗi tổ tiên: ", random_ancestral)
print(data)
