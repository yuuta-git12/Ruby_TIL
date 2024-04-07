# 10進数を16進数に変換するto_hexメソッド
# 引数は３つの整数
# 3つの整数をそれぞれ16進数に変換した文字列を返す
# 先頭に#をつける
def to_hex(r,g,b)
  # 10進数を16進数に変換するにはto_sメソッドを使う
  # '#'+
  # r.to_s(16).rjust(2,'0')+
  # g.to_s(16).rjust(2,'0')+
  # b.to_s(16).rjust(2,'0')

  # リファクタリング1
  # hex = '#'
  # [r,g,b].each do |n|
  #   hex += n.to_s(16).rjust(2,'0')
  # end
  # hex
  # リファクタリング2
  # ブロック内のto_s()の戻り値を受け取る
  # sumで戻り値の合計を返す
  [r,g,b].sum('#') do |n|
    n.to_s(16).rjust(2,'0')
  end
end

# 16進数を10進数に変換するメソッドto_intsメソッド
# RGBの3つの引数受け取る
# 3つの引数それぞれを10進数に変換する返り値は配列
def to_ints(hex)
  # r = hex[1..2]
  # g = hex[3..4]
  # b = hex[5..6]
  # r,g,b = hex[1..2],hex[3..4],hex[5..6]
  # ints = []
  # [r,g,b].each do |n|
  #   ints << n.hex
  # end
  # ints

  # リファクタリング1 mapメソッドを使う
  # [r,g,b].map do |n|
  #   n.hex
  # end
  # リファクタリング2 多重代入を使う
  # r,g,b = hex[1..2],hex[3..4],hex[5..6]
  # リファクタリング3 正規表現とscanメソッドを使う
  # hex.scan(/\w\w/).map do |n|
  #   n.hex
  # end
  # リファクタリング4 &とシンボルを使う
  hex.scan(/\w\w/).map(&:hex)

end
