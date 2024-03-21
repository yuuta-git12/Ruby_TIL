puts 1 + 2

a = 'Hello,world!'
puts a

b = 'こんにちは'
puts b

n = 1
# n++
n += 1
puts n

n = 1
n -= 1
puts n

n = 2
n *= 2
puts n

n = 2
n /= 2
puts n

n = 2
n **= 3
puts n

a = 0.1
b = 3.0
puts a.rationalize*b.rationalize

n = 9
result = if n>10
  '10より大きい'
else
  '10より小さい'
end

puts result

point = 7
day = 1
# 1日であればポイント5倍
if day == 1
  point *= 5
end
puts point

# 後置ifを使った書き方
point = 7
day = 1
# 1日であればポイント5倍
point *= 5 if day == 1
puts point
