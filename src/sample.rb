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

# %q!　!はシングルクオートで囲んだことと同じになる
puts %q!He said,"Don't speak."!

# %Q!　!はダブルクオートで囲んだことと同じになる(改行文字、式展開が使える)
something = "Hello."
puts %Q!He said,"#{something}"!

# %!　!もダブルクオートで囲んだことと同じになる
something = "Bye."
puts %!He said,"#{something}"!

a = <<TEXT
これはヒアドキュメントです。
複数行にわたる長い文字列を作成するのに便利です。
TEXT

puts a

name = 'Alice'
a = <<TEXT
ようこそ,#{name}さん!
以下のメッセージをご覧ください.
TEXT
puts a

# ビッドごとの論理積(AND)
puts sprintf '%#b',(0b1010 & 0b1100)
# ビッドごとの論理和(OR)
puts sprintf '%#b',(0b1010 | 0b1100)
# ビットごとの排他的論理和
puts sprintf '%#b',(0b1010 ^ 0b1100)
# 右ビットシフト
puts sprintf '%#b',(0b1010 >> 1)
# 左ビットシフト
puts sprintf '%#b',(0b1010 << 1)
# ビットごとの論理反転(NOT)
puts sprintf '%#b',~0b1010

status = 'error'
if status != 'ok'
  puts '何か異常があります'
end

status = 'ok'
unless status =='ok'
  puts '何か異常があります'
else
  puts '正常です'
end

result =
unless status =='ok'
  '何か異常があります'
else
  '正常です'
end

puts result

status = 'no'
puts '何か異常があります' unless status == 'ok'

s = ""
if s.empty?
	puts '空文字です'
end

n = 123
unless n.zero?
  puts 'ゼロではありません'
end

user = nil
unless user
  puts 'nilです'
end

if user.nil?
  puts 'nilです'
end

country = 'italy'

case country
  when 'japan'
    p 'こんにちは'
  when 'us'
    p 'Hello'
  when 'italy'
    p 'Ciao'
  else
    p '????'
end

country = 'アメリカ'

message =
  case country
    when 'japan','日本'
      p 'こんにちは'
    when 'us','アメリカ'
      p 'Hello'
    when 'italy','イタリア'
      p 'Ciao'
    else
      p '???'
  end

p message

n = 11
n>10?p('10より大きい'):p('10以下')

def default(a,b,c=0,d=0)
  p "a=#{a},b=#{b},d=#{d},d=#{d}"
end

default(1,2)
default(1,2,3)
default(1,2,3,4)


def foo(time=Time.now,message = bar)
  puts "#OpenTime:#{time},message:#{message}"
end

def bar
  'BAR'
end

foo

# 通常のメソッド定義
def add(a,b)
  a + b
end

# エンドレスメソッド定義
def add(a,b)=a+b

p add(1,2)

n = 11
n>10?p('10より大きい'):p('10以下')

a = 'hello'
b = 'hello'
c = b

def m!(d)
  # p d.object_id
  d.upcase!
end

m!(c)

p a
p b
p c

require 'date'
puts Date.today
