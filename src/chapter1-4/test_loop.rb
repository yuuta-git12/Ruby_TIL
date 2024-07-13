# timesメソッド
# 配列を使わず、n回処理を繰り返したいという場合に使う。(0,1,2,3,4の和を計算)
sum = 0
5.times{|n| sum += n}
p sum
# -----実行結果-----
# 10

## ブロックパラメータ省略可能
5.times{sum += 1}
p sum



# uptoメソッド downtoメソッド
# uptoメソッド：数値を1ずつ増やしながら処理を行う
# 10~14まで値を一つずつ増やしたものを配列に入れる
a = []
10.upto(14){ |n| a<<n}
p a

# uptoメソッド：数値を1ずつ減らしながら処理を行う
# 14~10まで値を一つずつ減らしたものを配列に入れる
a = []
14.downto(10){ |n| a<<n}
p a

# stepメソッド
# 開始値.step(上限値,一度に増減する大きさ)
# 例：1~10の範囲で2ずつ値を増やして配列に入れる
a = []
1.step(10,2){|n| a<<n}
p a
# 例：10~1の範囲で2ずつ値を減らして配列に入れる
a = []
10.step(1,-2){|n| a<<n}
p a

# while文
# 例：配列の要素数が5になるまで繰り返し値を追加する
a = []
while a.size < 5
  a<<1
end
p a

# doを使って1行で書くこともできる
a = []
while a.size < 5 do a<<1 end
p a

# while文を後ろに書いて1行で書く方法
a = []
a << 1 while a.size < 5
p a

# どんな条件でも最低1回は実行したい、という場合はbegin...endでwhileを囲む
a = []
# a<<1は実行されない
while false
  a<<1
end

# 最低一回はa<<1が実行される
begin
  a<<1
end while false
p a

# until文：条件が偽である間、処理を繰り返す
# 例：配列の要素数が３以下になるまで配列の要素を後ろから削除する
a = [10,20,30,40,50]
until a.size <= 3
  a.delete_at(-1)
end
p a

# for文　「配列やハッシュ」を繰り返し処理できる
numbers = [1,2,3,4]
sum = 0
for n in numbers
  sum += n
end
p sum

# doも用いて1行で書く
sum = 0
for n in numbers do sum += n end
p sum

# loopメソッド
# 意図的に無限ループを作成できる
numbers = [1,2,3,4,5]
loop do
  # sampleメソッドでランダムに要素を1つ取得する
  n1 = numbers.sample
  puts n1
  # 5の場合にbreakしループを抜ける　while文の中にbreakを入れることもできる
  break if n1 == 5
end

# 再帰呼び出し
# 階乗の計算を行うメソッド
def factorial(n)
  # 引数が0になったら1を返して繰り返し処理が終了する
  n > 0?n*factorial(n-1):1
end
p factorial(5)
p factorial(0)

# 再帰呼び出しを使わずに会場を計算する例
def factorial2(n)
  ret = 1
  (1..n).each{|n| ret*=n}
  ret
end
p factorial2(5)
p factorial2(0)
