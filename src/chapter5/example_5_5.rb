UNITS = { m: 1.0, ft: 3.28, in: 39.37 }

def convert_length(legnth, from: :m, to: :m)
  # 計算結果は小数点2桁にする
  (legnth * UNITS[to] / UNITS[from]).round(2)
end
