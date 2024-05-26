
# ハッシュのキーにシンボルを使った書き方
person = {
  name: 'Alice',
  age: 20,
  friends: ['Bob', 'Carol'],
  phones: { home: '1234-0000', mobile: '5678-0000' }
}

def buy_burger(menu, drink: true, potato: true)
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
  p message
end

buy_burger('cheese')

buy_burger('fish', drink: false)

buy_burger('big', potato: true, drink: true)
