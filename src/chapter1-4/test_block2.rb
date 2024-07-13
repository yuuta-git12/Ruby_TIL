# mapメソッド(エイリアスメソッドはcollect)
# ブロックの戻り値が配列の要素となる新しい配列がさ作成される
# 空の配列を用意して、他の配列をループ処理した結果を空の配列に詰め込む処理は
# mapメソッドで置き換えることができる
numbers = [1,2,3,4,5]
new_numbers = numbers.map{|n| n*10}
p new_numbers


# selectメソッド(エイリアスメソッドはfind_all)
# 配列の各要素に対してブロックを評価し、その戻り値が真の要素を
# 含めた配列を返す
# 以下は偶数の数値だけを集めた配列even_numbersと基数の数値だけを集めた配列odd_numbers
# を作る処理
even_numbers = numbers.select{ |n| n.even?}
odd_numbers = numbers.select{ |n| n.odd?}

p even_numbers
p odd_numbers

# rejectメソッド
# ブロックの戻り値が真になった要素を除外した配列を返す
numbers = [1,2,3,4,5,6]
# 3の倍数を除外する(3,6を除外した配列が返される)
non_multipels_of_three = numbers.reject{|n| n%3==0}
p non_multipels_of_three

# findメソッド(エイリアスメソッドはdetect)
# ブロックの戻り値が真になった最初の要素を返す
even_numbers2 = numbers.find{ |n| n.even?}
p even_numbers2

# sumメソッド
# 要素の合計を求めるメソッド
sum = numbers.sum
p sum

# 要素を2倍しながら合計する
sum2 = numbers.sum{|n| n*2}
p sum2

# 初期値を設定し、その値も合わせて合計する
sum3 = numbers.sum(5)
p sum3

#===========================================================
# 文字列の連結
# 初期値に文字列を指定することで、各要素の文字列を連結することができる
# 初期値（先頭の文字列)を設定したり、ブロック内での文字列の加工が出来る
chars = ['a', 'b', 'c']
sum_char = chars.sum('')
p sum_char

# 文字列の連結はjoinと使うことでも行える
p chars.join
# 区切り文字を-にするjoinの第一引数に区切り文字を指定できる
p chars.join('-')

# joinは連結する際にto_sメソッドで書く要素を文字列に変換してから
# 連結するので、文字列以外の要素が含まれていても問題ない
chars2 = [1,2,'2','dd']
p chars2.join
