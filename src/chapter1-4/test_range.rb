range = [1,2,4,5,7]
p range[0..2]

str = 'abcdet'
p str[1...5]

# 不等号を使う場合
# 述語メソッド(メソッド名の後ろに?をつけることで真偽値を返すメソッドになる)
def liquid?(temperature)
  0<=temperature&&temperature<=100
end

p liquid?(-1)
p liquid?(0)
p liquid?(99)
p liquid?(100)

# 範囲オブジェクトを使う場合
def liquid?(temperature)
  (0..100).include?(temperature)
end

p liquid?(-1)
p liquid?(0)
p liquid?(99)
p liquid?(100)

# case文で範囲指定することもできる
def charge(age)
  case age
  when 0..5
    0
  when 6..12
    300
  when 13..18
    600
  else
    1000
  end
end

p charge(3)
p charge(12)
p charge(16)
p charge(25)

# 値が連続する配列の作成
# to_a：オブジェクトを配列として返す
p (1..5).to_a
p (1...5).to_a
p [*1..5]
p [*1...5]

p ('a'..'e').to_a
p ('a'...'e').to_a

p ('bad'..'bag').to_a
p ('bad'...'bag').to_a

# 繰り返し処理
# 範囲オブジェクトを入れるに変換してから繰り返し処理を行う
numbers = (1..4).to_a
sum = 0
numbers.each {|n| sum += n}
p sum

sum = 0
# 範囲オブジェクトに対して、直接eachメソッドを呼び出す
(1..4).each {|n| sum += n}
p sum

# stepメソッドで値を増やす間隔を指定する
numbers = []
# 1から10まで2回ごとに繰り返し処理を行う
(1..10).step(2){|n| numbers<<n}
p numbers
