# 国名に応じて通貨を返す（該当する通貨がなければnil)
def find_currency(country)
  currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
  currencies[country]
end


# 指定された国の通貨を大文字にして返す
def show_currency(country)
  currency = find_currency(country)
  # nilでないことをチェック
  # currencyがnilの場合を考慮して、&.演算子でメソッドを呼び出す
  currency&.upcase
end

puts show_currency(:japan)
puts show_currency(:brazil)
