def to_hex(r,g,b)
    [r,g,b].inject('#') do |hex,n|
       hex += n.to_s(16).rjust(2,'0')
    end
    # hex   ブロックの戻り値がinjectメソッド自身の戻り値になる為、to_hexで戻り値を記載する必要なし
    # eachメソッドの戻り値はメソッドの対象となる。この場合は[r,g,b]なので、最後に戻り値の変数を書いていないと
    # [r,g,b]が返される。
end

def to_ints(hex)
    
    # 下記の正規表現は
    # アルファベット、アンダーバー、数字が2つ並んだものを抜き出す
    hex.scan(/\w\w/).map(&:hex)
end