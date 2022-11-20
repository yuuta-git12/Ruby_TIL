# 長さの単位を変換する
# ===引数
# * +length+ - 長さ
# * +unit_from+ - 変換前の単位の比率
# * +unit_to+ -   変換後の単位の比率
# ===戻り値
# * lengthの値がunit_toの単位に換算された値が返される。

UNITS = {m:1.0, ft:3.28, in:39.37, cm:100.0}    # 定数として定義し直し,メソッド外に書かないとエラーになる
def convert_length(length, from: :m, to: :m)
    (length / UNITS[from]*UNITS[to]).round(2)
end
