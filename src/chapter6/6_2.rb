
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

# 正規表現にマッチする部分を配列に入れて返す
def regexp_scan()
  p '123 456 789'.scan(/\d+/)
  p '1977年7月17日 2021年12月31日'.scan(/(\d+)年(\d+)月(\d+)日/)
  # キャプチャせずにマッチした文字列全体を取得する方法
  p '1977年7月17日 2021年12月31日'.scan(/(?:\d+)年(?:\d+)月(?:\d+)日/)
end

# []に正規表現を渡すと。文字列から正規表現にマッチした部分を抜き出す。
# sliceでも同じことができる
def regexp_slice()
  text = '郵便番号は、123-4567です'
  puts text[/\d{3}-\d{4}/]
  puts text.slice(/\d{3}-\d{4}/)

  # マッチする部分が複数の場合は最初にマッチした文字列が返る
  text2 = '郵便番号は、123-4567です999-3333'
  puts text2[/\d{3}-\d{4}/]
  puts text2.slice(/\d{3}-\d{4}/)

  text3 = '私の誕生日は1977年7月17日です'
  puts text3[/(\d+)年(\d+)月(\d+)日/]
  puts text3.slice(/(\d+)年(\d+)月(\d+)日/)

  # キャプチャを使うと第二引数で指定した番号のキャプチャを取得できる
  puts text3[/(\d+)年(\d+)月(\d+)日/, 3]
  puts text3[/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/, 'day']
  puts text3.slice(/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/, 'day')

  # 破壊的な取り除き
  puts text3.slice!(/(\d+)年(\d+)月(\d+)日/)
  puts text3
end

# マッチした文字列を区切り文字にして文字列を分解し、配列として返す
def regexp_split()
  text = '123,456-789'
  p text.split(/,|-/)
end

# マッチした部分を第２引数で置き換える
def regexp_gsub()
  text = '123,456-789'
  p text.gsub(',','.') # ,を.に置き換え
  p text.gsub(/,|-/,'.') # ,または-を.に置き換える
  # 変換のルールをハッシュに記述して実行することもできる
  rule = {',' => ':','-'=>'/'}
  p text.gsub(/,|-/,rule)
end

regexp_gsub()
