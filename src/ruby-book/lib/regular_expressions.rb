# 正規表現の勉強用コード

#　様々な形な電話番号を正規表現で検索する。
def tel_number()
    text = <<-TEXT
    名前：伊藤淳一
    電話：03(1234)5678
    電話：090-1234-5678
    電話：0795(12)3456
    電話：04992-1-2345
    電話:9999-99-9999
    住所：兵庫県西脇市板波町1-2-3
    TEXT
    puts "パターン1の結果:#{text.scan /\d{2,5}-\d{1,4}-\d{1,4}/}"

    puts "パターン2の結果:#{text.scan /\d{2,5}[-(]\d{1,4}[-)]\d{1,4}/}"

    puts "パターン3の結果:#{text.scan /0[1-9]\d{0,3}[(-]\d{1,4}[-)]\d{1,4}/}"
end

# 表記ゆれを正規表現で検索する。
def write_form()
    text = <<-TEXT
    クープバゲットのパンは美味しかった。
    今日はクープ バゲットさんに行きました。
    クープ　バゲットのパンは最高。
    ジャムおじさんのパン、ジャムが入ってた。
    また行きたいです。クープ・バゲット。
    クープ・バケットのパン、売り切れだった（><）
    TEXT

    # 対象の文字列を抽出する場合
    puts "パターン1の結果:#{text.scan /クープ[ 　・]バゲット/}"
    puts "パターン2の結果:#{text.scan /クープ[ 　・]バ[ゲケ]ット/}"
    puts "パターン3の結果:#{text.scan /クープ.?バ[ゲケ]ット/}"
    
    # 対象の文字列が含まれた行を抽出する場合
    puts text.split(/\n/).grep(/クープ.?バ[ゲケ]ット/)
    
end

# HTMLからoptionの内容を抜き出す
def html_option()
    text = <<-TEXT
    <select name="game_console">
    <option value="none"></option>
    <option value="nintendo_switch" selected>ニンテンドースイッチ</option>
    <option value="wii_u">Wii U</option>
    <option value="ps4">プレステ4</option>
    <option value="gb">ゲームボーイ</option>
    </select>
    TEXT

    puts "パターンの1結果:#{text.scan /value="[a-z0-9_]+"/}"
    # =>パターンの結果:["value=\"wii_u\"", "value=\"ps4\"", "value=\"gb\""]

    puts "パターンの2結果:#{text.scan />.+</}"

    puts "パターンの3結果:#{text.scan /<option value="[a-z0-9_]+">.+<\/option>/}"

    puts "パターンの4結果:#{text.scan /<option value="([a-z0-9_]+)">(.+)<\/option>/}"
    # => パターンの4結果:[["wii_u", "Wii U"], ["ps4", "プレステ4"], ["gb", "ゲームボーイ"]]

    # バージョン1
    result = text.scan /<option value="([a-z0-9_]+)">(.+)<\/option>/
    result.each do |value,text1| puts "#{value},#{text1}" end
    
    # バージョン2 表示テキストがないoptionを検索
    result2 = text.scan /<option value="([a-z0-9_]+)">(.*)<\/option>/
    result2.each do |value,text2| puts "#{value},#{text2}" end

    # バージョン3 
    result3 = text.scan /<option value="([a-z0-9_]+)"(?: selected)?>(.*)<\/option>/
    result3.each do |value,text3| puts "#{value},#{text3}" end

    
    # バージョン4 コードのリファクタリング
    result4 = text.scan /<option value="(\w+)"(?: selected)?>(.*)<\/option>/
    result4.each do |value,text4| puts "#{value},#{text4}" end
    
    
    # バージョン5 コードの再リファクタリング
    replaced = text.gsub /<option value="(\w+)"(?: selected)?>(.*)<\/option>/ ,'\1,\2'
    puts replaced
    # => 実行結果
    # <select name="game_console">
    # none,
    # nintendo_switch,ニンテンドースイッチ
    # wii_u,Wii U
    # ps4,プレステ4
    # gb,ゲームボーイ
    # </select>
end

# コード上の無駄なスペースやタブを削除する
def delete_tab_space()
    text = <<-TEXT
    def hello(name)
      puts "Hello, \#{name}!"
    end

    hello('Alice')

    hello('Bob')
    
    hello('Carol')
    TEXT
    puts text.gsub(/^[ \t]+$/, '')
end