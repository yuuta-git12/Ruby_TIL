def convert_hash_syntax(old_syntax)
  # \1:→1番目にキャプチャされた文字列を表している
  # old_syntax.gsub(/:(\w+) *=> */, '\1: ')

  # キャプチャされた文字列を組み込み変数で取得した場合の方法
  old_syntax.gsub(/:(\w+) *=> */) do
    "#{$1}: "
  end
end
