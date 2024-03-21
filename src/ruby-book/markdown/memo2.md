[qiitaの初心者歓迎！手と目で覚える正規表現入門・その２「微妙な違いを許容しつつ置換しよう」の内容をまとめたノート](https://qiita.com/jnchito/items/64c3fdc53766ac6f2008)

・様々な区切り文字を許容する

	文字列内で半角スペース、全角スペース、・などで文字が区切られている文字列を
	検索する場合、[]を使う。[]内に半角スペース、全角スペース、・を入れ、
	「[a-z][ 　・][a-z}」とすると、半角スペース、全角スペース、・で区切られた
	小文字のアルファベットの文字列を検索することができる。
	

・区切り文字の有無を許容する

	「〜が1文字、または無し」などを表現したい場合は「？」というメタ文字を
	使う。
	例)    「[a-z][ 　・]?[a-z} 」とすると、半角スペース、全角スペース、・で区切られた
		または区切りのない、小文字のアルファベットの文字列を検索できる。


・区切り文字を簡易的に表現する

	半角スペース、全角スペース、・を表現させるために書いた[ 　・]は
	「任意の1文字」を表すメタ文字「.」を使って表すことができる。
	上記の例をメタ文字「.」を使って表すと、
```
[a-z].?[a-z} 
```
	で表すことができる。
	

・HTMLタグをCSVへ変換する 

	下記のHTMLソースからoptionの内容を抜き出す。
```
<select name="game_console">
<option value="none"></option>
<option value="wii_u">Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>
```
	最終結果は下記のようにしたい。
```
wii_u,Wii U
ps4,プレステ4
gb,ゲームボーイ
```

    ・valueを抜き出す正規表現

	上記のvalueのパターン
	「value=、ダブルクォート、英数字またはアンダーバー、ダブルクォート」
	これを正規表現で表すと
```
	value="[a-z0-9_]+"
```
	「+」は「直前の文字が1文字以上」を意味するメタ文字です。
	「[a-z0-9_]+」とすることで、
	「a~zまたは0~9または_(アンダーバー)が1文字以上ある」と表すことができます。
	

    ・表示テキストを抜き出す正規表現

	上記のパターンだと、
	「>表示テキスト<」と表すことができる。「.」と「+」を使うと
```
	>.<
```
	で表すことができる。
	

    ・行全体にマッチする正規表現を作る。

```
    <option value="[a-z0-9_]+">.+<\/option>
```
	この中で正規表現は「[a-z0-9_]+」と「.+」、「/option」の前の「\」は「/」をエスケ
	ープするためのエスケープ文字


    ・valueと表示テキストの部分を( )で囲んでキャプチャする

	valueの中身と表示テキストを( )で囲みキャプチャする。
```
    <option value="([a-z0-9_]+)">(.+)<\/option>
```
	rubyで上記の正規表現を実行すると、以下の値が返ってくる。
```
    [["wii_u", "Wii U"], ["ps4", "プレステ4"], ["gb", "ゲームボーイ"]]
```

    ・valueと表示テキストを抜き出すコード

```
# rubyの場合
result = text.scan /<option value="([a-z0-9_]+)">(.+)<\/option>/

result.each do |value,text1| puts "#{value},#{text1}" end
# => 
#     wii_u,Wii U
#     ps4,プレステ4
#     gb,ゲームボーイ
```
上記コードの正規表現で「(.+)」の部分を「(.*)」と変更することで、
「直前の文字が1文字以上」から「直前の文字が0文字以上」に意味が変わります。

```
# rubyの場合
result2 = text.scan /<option value="([a-z0-9_]+)">(.*)<\/option>/

result2.each do |value,text2| puts "#{value},#{text2}" end
# => 
#     none,
#     wii_u,Wii U
#     ps4,プレステ4
#     gb,ゲームボーイ
```


・selectedになっているoptionも置換できるようにする

	HTMLソースの内容が下記のような場合、selectedが入っているoptionも抜き出したい
	場合は先ほどのコードでは上手くいきません。
```
<select name="game_console">
<option value="none"></option>
<option value="nintendo_switch selected>ニンテンドースイッチ</option>
<option value="wii_u">Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>

# 実行結果
# none,
# wii_u,Wii U
# ps4,プレステ4
# gb,ゲームボーイ
```
	正規表現部分を下記のように書き直すと上手くいきます。
	追加した正規表現は「(?: selected)?」になります。
	検索した文字列selectedを()で囲いグループ化することで、
	( selected)?が「文字列 selectedがある、またはない」を表します。
	「?:」は( )で囲ったグループはキャプチャしないことを表します。
	「?:」場合の実行結果も下記に記載します。
```
# rubyの場合
result3 = text.scan /<option value="([a-z0-9_]+)"(?: selected)?>(.*)<\/option>/

result3.each do |value,text3| puts "#{value},#{text3}" end

# =>
# none,
# nintendo_switch,ニンテンドースイッチ
# wii_u,Wii U
# ps4,プレステ4
# gb,ゲームボーイ

# =>　「?:」がない場合の実行結果
# none,
# nintendo_switch, selected
# wii_u,Wii U
# ps4,プレステ4
# gb,ゲームボーイ
```


・正規表現のリファクタリング

　上記で書いた正規表現をメタ文字を使って置き換えます。
```
<option value="([a-z0-9_]+)"(?: selected)?>(.*)<\/option>/
```
　「0-9」は「\d」に、
```
<option value="([a-z\d_]+)"(?: selected)?>(.*)<\/option>/
```
	「[a-z\d_]」は「\w」というメタ文字に置き換えることができます。
	(アルファベットが小文字だけでなく大文字も検索対象になりますが。)
```
<option value="(\w+)"(?: selected)?>(.*)<\/option>/
```


・* と + は「貪欲」であることに注意！

	もし、今回の検索対象だったHTMLコードが下記のように改行のない状態のテキスト
	だった場合、
```
<select name="game_console"><option value="none"></option><option value="wii_u">Wii U</option><option value="ps4">プレステ4</option><option value="gb">ゲームボーイ</option></select>
```
	作成した正規表現で検索すると返ってくる値は、
```
none,</option><option value="wii_u">Wii U</option><option value="ps4">プレステ    4</option><option value="gb">ゲームボーイ
```
	となります。
	「.*」がテキスト上の一番最後の「<」の手前まで文字列だと判断して文字を抜き出
	したことが原因です。
　　対策としては、条件を厳しくし、下記のように正規表現を書き換えます。
```
<option value="(\w+)"(?: selected)?>([^<]*)<\/option>/
```
	「(.*)」を「([^<]*)」に変更することで、「<以外の任意の文字が0文字以上」に
	意味が変わりました。
	もう一つの解決策は、「最短のマッチを返すように指定する」です。
```
>(.*)<
```
	問題の正規表現は「<で始まり、任意の文字が0個以上連続し（.*）、 最後に見つかった <で終わる」
	「*?」や「.?」と書くと最短のマッチを結果として返す。要は一番最初に条件に
	マッチした結果を返すということ。
	ただし、この方法は使えない実行環境もある。
	