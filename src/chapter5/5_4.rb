
# ハッシュのキーにシンボルを使った書き方
person = {
  name: 'Alice',
  age: 20,
  friends: ['Bob', 'Carol'],
  phones: { home: '1234-0000', mobile: '5678-0000' }
}

def buy_burger(menu, drink: true, potato: true, **others)
  # ハンバーガーを購入
  message = "メニュー:#{menu}"

  if drink
    # ドリンクを購入
    message << ' ドリンク付き'
  end

  if potato
    # ポテトを購入
    message << ' ポテト付き'
  end
  puts message
  # 指定されていないキーワードを表示する処理
  puts others
end

buy_burger('cheese')

buy_burger('fish', drink: false)

buy_burger('big', potato: true, drink: true)

buy_burger('big', potato: true, drink: true, chicken: false)

# ハッシュを変数として宣言しメソッドの引数に渡す
params = {potato: true, drink: true, chicken: false}
# **をつけることで、ハッシュをキーワード引数に変換できる
buy_burger('cheese', **params)

def buy_burger2(menu, options={})
  puts options
end

# どちらも同じ結果を出力する(あくまで「最後の引数がハッシュであれば」)
buy_burger2('fish', {'drink' => true, 'potato' => false})
buy_burger2('fish', 'drink' => true, 'potato' => false)

# Rubyはメソッド呼び出しの()を省略できる(上記の文と同じ結果)
buy_burger2 'fish', {'drink' => true, 'potato' => false}
buy_burger2 'fish', 'drink' => true, 'potato' => false
