numbers = [1,2,3,4]
sum = 0
# 配列numbersのeachメソッドを使って
# 配列の要素を最初から最後まで取り出す
# 取り出した要素は|n|のブロックパラメータnに入る
# sumはブロックパラメータnを使って処理を実行する
numbers.each do |n|
  sum += n
end
p sum

a = [1,2,3,4,5,6,7]
# 配列から値が基数の要素を削除する
# delete_ifメソッドは戻り値が真なら配列から削除、偽なら配列に残す処理をする
a.delete_if do |n|
  # 数値が基数の場合Trueを返す
  n.odd?
end
p a

sum = 0
numbers.each { |n|
  sum_value = n.even? ? n*10:n # ブロックの中で定義された変数はブロック外で呼び出せない
  sum += sum_value
}

p sum
# p sum_value
