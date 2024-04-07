puts "Hello World"

a = [1, 2, 3]
p a.size
p a.length

a[4] = 50
p a

b = [0]
b<<1
b<<2
b<<3
p b

p b.delete_at(1)
p b

# 配列の多重代入
a,b = [[1,3,5],2]
p a
p b

# divmodメソッドは商と余りを配列で返す(19/3の章と余りを返す)
p 19.divmod(3)

# 戻り値を配列のまま受け取る場合
quo_rem = 19.divmod(3)
puts "商=#{quo_rem[0]},余り=#{quo_rem[1]}"

# 多重代入で別々の変数として受け取る場合
quotient, remainder = 19.divmod(3)
puts "商=#{quotient},余り=#{remainder}"
