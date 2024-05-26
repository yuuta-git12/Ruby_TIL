
start_time = Time.now

currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }

p currencies['japan']

currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }

p currencies[:japan]

p "処理速度 #{Time.now - start_time}"
