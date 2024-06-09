
# ハッシュのキーにシンボルを使った書き方
person = {
  name: 'Alice',
  age: 20,
  friends: ['Bob', 'Carol'],
  phones: { home: '1234-0000', mobile: '5678-0000' }
}

def buy_burger(menu, options = {})
  # ハンバーガーを購入
  message = "メニュー:#{menu}"
  drink = options[:drink]
  potato = options[:potato]
  if drink
    # ドリンクを購入
    message << ' ドリンク付き'
  end

  if potato
    # ポテトを購入
    message << ' ポテト付き'
  end
  puts message
end

buy_burger('cheese')

buy_burger('fish', drink: false)

buy_burger('big', potato: true, drink: true)

# 擬似キーワード引数の場合はどんなキーワードを指定してもエラーにならない
# 無効なキー(ここではchicken)をエラーにするためにはメソッド側で明示的な実装が必要
buy_burger('big', potato: true, drink: true, chicken: false)
