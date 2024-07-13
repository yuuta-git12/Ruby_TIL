
start_time = Time.now

currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }

puts currencies['japan']

currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }

puts currencies[:japan]

puts "処理速度 #{Time.now - start_time}"

# ハッシュを配列に変換
p currencies.to_a


array = [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]
# 配列をハッシュに変換
p array.to_h
