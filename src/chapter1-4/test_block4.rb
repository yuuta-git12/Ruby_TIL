# 繰り返し処理をしつつ、処理している要素の添字も取得したい場合
# each_with_indexメソッドを使う
fruits = ['apple','orange','melon']
fruits.each.with_index{|fruit,i| puts "#{i}:#{fruit}"}

# mapメソッドと組み合わせる 配列として取得
index_fruits = fruits.map.with_index{|fruit,i| "#{i}:#{fruit}"}
p index_fruits

# delete_ifと組み合わせる 文字列aと含み偶数のもの以外を配列として取得
delete_if_fruits = fruits.delete_if.with_index{|fruit,i| fruit.include?('a')&&i.odd?}
p delete_if_fruits

# with_indexメソッド　Enumeratorクラスのインスタンスメソッド
# each,map,delete_ifはブロックなしでメソッドを呼ぶとEnumeratorオブジェクト
# が返るため、with_indexメソッドが使える
p fruits.each
p fruits.map
p fruits.delete_if

#----------------------------------------------------------------

# 添え字の始まりを任意の数字に変更する
fruits = ['apple','orange','melon']
fruits.each.with_index(1){|fruit,i| puts "#{i}:#{fruit}"}

index_fruits = fruits.map.with_index(10){|fruit,i| "#{i}:#{fruit}"}
p index_fruits


# 配列とブロックパラメータ
dimensions = [
  [10,20],
  [30,40],
  [50,60]
]

areas = Array.new()
dimensions.each.with_index do|(length,width),i|
  areas << length*width
  puts "length:#{length},width:#{width},i:#{i}"
end

# p areas

# 番号指定パラメータを使うことで、パラメータの順番に応じて_1から_9までの番号を使える
dimensions = [
  [10,20],
  [30,40],
  [50,60]
]
dimensions.each{p _1}
# 入れ子の配列を使った場合、
# _1には入れ子になった入れるの最初の要素
# _2には２つ目の要素が入る
dimensions.each{puts "#{_1},#{_2}"}

# ブロックを使ったテキストファイルへの書き込み
# ファイルのオープン・クローズ処理は自動的に行われる
File.open('./sample.txt','w') do |file|
  file.puts('1行目のテキストです。')
  file.puts('2行目のテキストです。')
  file.puts('3行目のテキストです。')
end

a = [1,2,3]
p a.delete(100)

# do...endの場合は指定した値が見つからない時の戻り値を
# 自分で設定できる
a.delete(100) do
  p 'NG'
end

p a.delete(100) {'NG'}

# エラーになる書き方
# a.delete 100 {'NG'}
