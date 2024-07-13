numbers = [10,20,30,40,50]

# 終端を省略した範囲オブジェクト
p numbers[2..] #=> [30, 40, 50]

# 始端を省略したオブジェクト
p numbers[..1] #=> [10, 20]

# 全範囲を表す範囲オブジェクト
p numbers[nil..nil]
p numbers[(nil..)]
p numbers[(..nil)]
