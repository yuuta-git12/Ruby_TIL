# &とシンボルでブロックを簡潔に書く
# 条件
# ブロックパラメータが1個だけ
# ブロックの中で呼び出すメソッドに引数がない(upcase,oddは引数がない)
# ブロックの中では、ブロックパラメータに対してメソッドを1回呼び出す以外の処理がない

r1 = ['ruby','java','python'].map{|s| s.upcase}
p r1
r2 = ['ruby','java','python'].map(&:upcase)
p r2

r3=[1,2,3,4,5,6,7].select{|n| n.odd?}
p r3
r4=[1,2,3,4,5,6,7].select(&:odd?)
p r4

# &:メソッド名の書き方に変換できない例
r5 = [1,2,3,4,5,6,7].select{|n| n%3 == 0}
p r5

r6 = [9,10,11,12].map{|n| n.to_s(16)}
p r6

r7 = [1,2,3,4].map do |n|
  m = n*4
  m.to_s
end
p r7
