def convert_hash_syntax(old_syntax)
    # gsubメソッドは第一引数の正規表現にマッチした文字列をを第二引数の文字列で置き換える
    # \1は正規表現で１番目にキャプチャされた文字列を表している。
    old_syntax.gsub /:(\w+) *=> */ ,'\1: '
end