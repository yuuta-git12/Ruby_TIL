# 繰り返し処理用の制御構造
# Rubyの繰り返し処理の動きを変えるための制御構造
# break
# next
# redo

numbers = [1,2,3,4,5].shuffle
numbers.each do |n|
  puts n
  # 5が出たら繰り返しを脱出する
  break if n == 5
end

i = 0
while i<numbers.size
  n = numbers[i]
  puts n
  break if n == 5
  i += 1
end

fruits = ['apple','melon','orange']
numbers = [1,2,3]
# :doneはタグを表している
# catchとthrowのタグが一致しない場合はエラーが発生する
ret =
  catch :done do
    fruits.shuffle.each do |fruit|
      numbers.shuffle.each do |n|
        puts "#{fruit},#{n}"
        # オレンジと3が出たら、ループを脱出する
        if fruit == 'orange' && n == 3
          throw :done,'クリア'
        end
      end
    end
  end

puts ret

numbers = [1,2,3,4,5]
numbers.each do |n|
  next if n.even?
  puts n
end

foods = ['ピーマン','トマト','セロリ']
count = 0
foods.each do |food|
  print "#{food}は好きですか？"
  answer = ['はい','いいえ'].sample
  puts answer
  count += 1

  # やり直しは２回までとする
  redo if answer != 'はい' && count<2

  # カウントをリセット
  count = 0
end
