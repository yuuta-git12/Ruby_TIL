# 配列[位置, 取得する長さ]
a = [1,2,3,4,5]

# 最初から２番目の要素から3つの要素を取得する
p a[1,3]

# 取得したい要素の添字を複数指定し
# arrayクラスで返される
p a.values_at(0,2,4)

# 最後の要素を取得する
p a[a.size - 1]
p a[-1]
p a.last

# 最後から２番目の要素を取得する
p a[-2]

# 最後から2番目の要素から2つの要素を取得する
p a[-2,2]

# 最後の2個の要素を取得できる
p a.last(2)

# 先頭の要素を取得する
p a.first
# 先頭から2つの要素を取得する
p a.first(2)

a[-3] = -10
p a

a[1,4] = 100
p a

# pushメソッドを使った要素の追加
b = []
b.push(1)
b.push(2,3)
p b

# 指定した値に一致する要素の削除 deleteメソッド
# 削除した値が戻り値になる
c = [1,2,3,1,2,4]
p c.delete(1)
p c

# 存在しない値を指定するとnilが返る
p a.delete(3)
p a

# concatメソッドで連結した場合　元の配列が変更される
a = [1]
b = [2,3]
array = a.concat(b)
p "array = #{array}"
p "a = #{a}"
p "b = #{b}"

# + 演算子で連結した場合 元の配列は変更されない（推奨)
a = [1]
b = [2,3]
array = a + b
p "array = #{array}"
p "a = #{a}"
p "b = #{b}"

# 配列の和集合
a = [1,2,3]
b = [3,4,5]
c = a | b
p "a = #{a}"
p "b = #{b}"
p "c = #{c}"


# 配列の差集合
# aの配列からbの配列に含まれる要素を取り除く
a = [1,2,3]
b = [3,4,5]
c = a - b
p "a = #{a}"
p "b = #{b}"
p "c = #{c}"


# 配列の積集合
# aの配列とbの配列に共通する要素を返す
a = [1,2,3]
b = [3,4,5]
c = a & b
p "a = #{a}"
p "b = #{b}"
p "c = #{c}"

# 配列よりも効率的に集合を扱えるSetクラスもある
# 本格的な集合演算をする場合は、Setクラスを使う方が良い
require 'set'
a = Set[1,2,3]
b = Set[3,4,5]
c1 = a | b
c2 = a - b
c3 = a & b
p "c1 = #{c1}"
p "c2 = #{c2}"
p "c3 = #{c3}"

# 多重代入で右辺の個数が多い場合、残りの要素を配列として受け取る
# 「左辺に対応する変数がない残りの要素」が代入される
e, *f = 100,200,300
p e
p f
a,*b,c,d = 1,2,3,4,5
p a
p b
p c
p d
a,*b,c,d = 1,2,3
p a
p b
p c
p d
# 多重代入で残りの要素を無視する場合
e,* = 100,200,300
p e

e, = 100,200,300
p e

# 配列を１つの配列として引数に渡す場合
a = []
a.push(1)
a.push([2,3])
p a

# 配列を複数の引数として渡す場合
a = []
a.push(1)
a.push(*[2,3])
p a

jp = ['日本','ja']
country = '日本'
case country
when *jp
  puts 'こんにちは'
end

def hello(*names,names1)
  puts "#{names.join('と')}おはよう。"
  puts "#{names1}こんにちは"
end

hello('武','薫','リョーマ')

a = [1,2,3]
a2 = [-1,0,a,4,5]
p a2

a = [1,2,4]
b = [1,2,4]
p a != b
p a == b

# %記法での文字列の配列の作り方

## 通常
AR_str = ['apple','melon','orange']
p AR_str

## %w記法1
AR_str1 = %w!apple melon orange!
p AR_str1

## %w記法2
AR_str2 = %w(apple melon orange)
p AR_str2

## %w記法3
AR_str3 = %w(
  apple
  melon
  orange
)
p AR_str3

## %w記法　値にスペースを含めたい場合
## バックスラッシュでスペースをエスケープする
AR_str4 = %w(big\ apple small\ melon orange)
p AR_str4

## 式展開、改行文字(\n)、タプ文字(\t)などを含めたい場合は%Wとする
AR_str5 = %W(big\n apple small\t melon orange)
p AR_str5

a = Array.new(5,0)
p a


p 'Ruby'.chars

p 'Ruby,Java,Python'.split(',')

# 配列にはブロックの戻り値がデフォルト値として設定される
a = Array.new(10){ |n| n }
p a
a = Array.new(10){ |n| n % 3 + 1}
p a

a = Array.new(5){'default'}
p a

a[0].upcase!
p a
