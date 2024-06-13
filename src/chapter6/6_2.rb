
def sample1()
  text = <<TEXT
  私の郵便番号は1234567です。
  僕の住所は6770056兵庫県西脇市板波町1234だよ。
TEXT

  puts text.gsub(/(\d{3})(\d{4})/) { "#{$1}-#{$2}" }
end

# 正規表現のキャプチャ利用
# テキストからキャプチャした内容をコンソールに表示する
def regexp_capture()
  text = <<TEXT
    私の誕生日は1977年7月17日です
TEXT

  if m = /(\d+)年(\d+)月(\d+)日/.match(text)
    i = 0
    while m[i]
      puts m[i]
      i += 1
    end
  else
    puts 'マッチするテキストはありません'
  end
end

# 正規表現のキャプチャ利用(キャプチャの結果に名前をつける)
# テキストからキャプチャした内容をコンソールに表示する
def regexp_capture_name()
  text = <<TEXT
    私の誕生日は1977年7月17日です
TEXT
  # =~演算子を使うとキャプチャの名前がそのままローカル変数に割り当てられる
  if /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/ =~ text
    puts "#{year}"
    puts "#{month}"
    puts "#{day}"
  else
    puts 'マッチするテキストはありません'
  end
end

regexp_capture_name()
