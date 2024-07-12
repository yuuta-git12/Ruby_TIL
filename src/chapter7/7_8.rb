class Product
  DEFAULT_PRICE = 0
  PRIVATE_DEFAULT_PRICE = 100

  # 定数をprivateにする
  private_constant :PRIVATE_DEFAULT_PRICE

  def foo
    # 定数はクラス構文の直下で作成する必要がある
    # メソッドの内部で定数を作成することはできない
    # DEF_PRICE = 0
  end
end

# クラス内で定義された定数を参照
p Product::DEFAULT_PRICE

# privateなのでクラスの外部からは参照できない エラーになる
# p Product::PRIVATE_DEFAULT_PRICE

# 配列を定数で定義しつつ、要素も同時に定数として定義することもできる
class TrafficLight
  COLORS = [
    GREEN = 0,
    YELLOW = 1,
    RED = 2
  ]
end

p TrafficLight::GREEN
p TrafficLight::YELLOW
p TrafficLight::RED
p TrafficLight::COLORS

# mapメソッドの戻り値を定数に代入することもできる
NUMBERS = [1, 2, 3].map{ |n| n*10 }
p NUMBERS

=begin
定数と再代入
=end
class Product_re_assigntment
  DEFAULT_PRICE = 0
  # 再代入して定数の値を書き換える warningは出るが実行できる
  DEFAULT_PRICE = 1000
end

p Product_re_assigntment::DEFAULT_PRICE
# クラスの外部からでも再代入ができる
Product_re_assigntment::DEFAULT_PRICE = 3000
p Product_re_assigntment::DEFAULT_PRICE

# 再代入を防止する場合はfreezeでクラスを凍結する
# Product_re_assigntment.freeze
# Product_re_assigntment::DEFAULT_PRICE = 4000 # エラーになる

=begin
定数はミュータブルなオブジェクトに注意する
=end
class ProductMutable
  NAME = 'A Product'
  SOME_NAMES = ['Foo', 'Bar', 'Baz']
  SOME_PRICES = { foo:1000, bar:2000, baz:3000 }
end

#文字列を破壊的に大文字に変更する
ProductMutable::NAME.upcase!
p ProductMutable::NAME

# 配列に新しい要素を追加する
ProductMutable::SOME_NAMES << 'Hoge'
p ProductMutable::SOME_NAMES

# ハッシュに新しいキーと値を追加する
ProductMutable::SOME_PRICES['Hoge'] = 4000
p ProductMutable::SOME_PRICES

class ProductMutable2
  SOME_NAMES = ['Foo', 'Bar', 'Baz']
  def self.names_without_foo(names = SOME_NAMES)
    # この処理を行うことで定数の中身が変わってしまう
    names.delete('Foo')
  end
end

p ProductMutable2::SOME_NAMES

p ProductMutable2.names_without_foo
# 定数の中身が変わった
p ProductMutable2::SOME_NAMES

# 対策　定数の配列をfreezeする
class ProductMutableFreeze
  # 配列を凍結する
  SOME_NAMES = ['Foo','Bar','Baz'].freeze

  def self.names_without_foo(names = SOME_NAMES)
    # freezeしている配列に対しては破壊的な変更はできない
    names.delete('Foo')
    names
  end
end

# 配列はfreezeになっているので変更を加えようとするとエラーになる
# p ProductMutableFreeze.names_without_foo


class ProductMutable3
  # 配列はfreezeされるが中身の文字列はfreezeされない
  SOME_NAMES = ['Foo','Bar','Baz'].freeze
end

# 1番目の要素を破壊的に大文字に変更する
ProductMutable3::SOME_NAMES[0].upcase!
# 1番目の要素の値が変わってしまう
p ProductMutable3::SOME_NAMES

class ProductMutableFreeze2
  # 配列とその中身の文字列もfreezeする
  # SOME_NAMES = ['Foo'.freeze,'Bar'.freeze,'Baz'.freeze].freeze
  # 書き換える以下のようになる
  SOME_NAMES = ['Foo', 'Bar', 'Baz'].map(&:freeze).freeze
end
# 変更はできずエラーとなる
ProductMutableFreeze2::SOME_NAMES[0].upcase!
