class Node:
    def __init__(self, name_val, depth):
        # Tách tên và giá trị nhánh từ chuỗi đầu vào
        name, val_str = name_val[::-1].split(":")
        self.name = name  # Tên nút
        self.depth = depth  # Độ sâu của nút
        self.value = float(val_str)  # Giá trị nhánh (branch length)
        self.children = []  # Danh sách các nút con
        self.parent = None  # Nút cha của nút hiện tại

    def get_depth(self):
        # Tính độ sâu bằng cách lần theo cha đến nút gốc
        current_node = self
        depth = 0
        while current_node.parent:
            current_node = current_node.parent
            depth += 1
        return depth

    def __str__(self):
        # Chuỗi mô tả nút (gồm độ sâu, tên và giá trị nhánh)
        return "{}:{}:{}".format(self.depth, self.name, self.value)

def get_nodes_at_depth(root, target_depth):
    # Lấy danh sách các nút ở độ sâu cụ thể
    nodes_at_depth = []
    stack = [root]  # Duyệt cây bằng stack
    while stack:
        node = stack.pop()
        if node.get_depth() == target_depth:  # Kiểm tra độ sâu
            nodes_at_depth.append(node)
        stack.extend(node.children)  # Thêm các nút con vào stack
    return nodes_at_depth

# Chuỗi Newick mẫu (biểu diễn cây tiến hóa)
newick = "(LngfishAu:0.1169020025,(LngfishSA:0.1176852672,LngfishAf:0.1239009509):0.0715570084,(Frog:0.1543000391,((Turtle:0.1359919445,((Sphenodon:0.1790145269,Lizard:0.2000157960):0.0276306717,(Crocodile:0.1672650550,Bird:0.1467020433):0.0628219641):0.0354153009):0.0431851261,(((Human:0.1362320641,(Seal:0.0755849014,(Cow:0.0683463595,Whale:0.0813507894):0.0284368863):0.0226144245):0.0281509264,(Mouse:0.0545375844,Rat:0.0701529201):0.0737329757):0.0386179209,(Platypus:0.1311729257,Opossum:0.1100511963):0.0381170515):0.0788243227):0.0799005249):0.0552466582):0"

root = None  # Nút gốc của cây
na = ""  # Biến tạm để lưu tên và giá trị nút
stack = []  # Stack để xử lý cấu trúc cây
max_depth = 0  # Độ sâu tối đa của cây

# Duyệt chuỗi Newick từ cuối lên đầu
for i in list(reversed(newick)):
    if len(stack) > max_depth:
        max_depth = len(stack)  # Cập nhật độ sâu tối đa
    if i == ')':  # Bắt đầu một nhánh
        if na != "":
            node = Node(na, len(stack))  # Tạo nút mới
            na = ""  # Reset biến tạm
            if len(stack):  # Nếu có nút cha
                stack[-1].children.append(node)  # Thêm vào danh sách con của cha
                node.parent = stack[-1]  # Gán nút cha
            else:
                root = node  # Nếu không có cha, đây là nút gốc
            stack.append(node)  # Đưa nút vào stack
    elif i == '(':  # Kết thúc một nhánh
        if (na != ""):
            node = Node(na, len(stack))  # Tạo nút mới
            na = ""
            stack[-1].children.append(node)
            node.parent = stack[-1]
        stack.pop()  # Loại bỏ nút đã xử lý khỏi stack
    elif i == ',':  # Phân tách các nút cùng cấp
        if (na != ""):
            node = Node(na, len(stack))
            na = ""
            stack[-1].children.append(node)
            node.parent = stack[-1]
    else:
        na += i  # Ghép ký tự thành chuỗi tên và giá trị nút

# In thông tin cây
print(max_depth)  # In độ sâu tối đa của cây
print_stack = [root]  # Stack để duyệt và in cây
while len(print_stack):
    node = print_stack.pop()
    print("\t" * node.get_depth(), node)  # In thông tin nút
    print_stack.extend(node.children)  # Thêm các nút con vào stack

# In các nút theo độ sâu
for i in range(0, max_depth):
    nodes_at_depth = get_nodes_at_depth(root, i)
    print(f"\t" * i + f"Các nút ở độ sâu {i}:")
    for node in nodes_at_depth:
        print("\t" * i, node)
    print()
