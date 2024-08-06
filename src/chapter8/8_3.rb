# モジュールの定義
# ログ出力用のメソッドを提供するモジュール
module Loggable

  # 現状のままだとlogメソッドはpublicメソッドになる
  # logメソッドはprivateメソッドにする
  private

  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  # モジュールLoggableをincludeする
  # モジュールをクラスにincludeして機能を追加することを「ミックスイン」という
  # 1つのクラスに複数のモジュールをミックスインすることで多重継承に似た仕組みを実現している
  include Loggable

  def title
    log('title is called.')
    'A great movie'
  end
end

class User
  include Loggable

  def name
    log('name is called')
    'Alice'
  end
end

product = Product.new
p product.title

user = User.new
p user.name


# include先のメソッドを使うモジュール
module Taggable
  def price_tag
    # priceメソッドはinclude先で定義されているはずという前提
    "#{price}円"
  end
end

class Product2
  include Taggable

  def price
    1000
  end
end

product2 = Product2.new
puts product2.price_tag

# モジュールをextendする
module Loggable2
  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product3
  # extendを使うことで、Loggableモジュールのメソッドを特異メソッド(クラスメソッド)として追加する
  extend Loggable2

  log 'これはクラス直下で呼び出されたlog'

  def self.create_products(name)
    # logメソッドをクラスメソッド内で呼び出す
    # つまりlogメソッド自体もクラスメソッドになっている
    log 'create_products is called.'
  end
end

test = Product3.new

# クラスメソッド経由でlogメソッドが呼び出される
Product3.create_products([])

# Productクラスのクラスメソッドとして直接呼び出すことも可能
Product3.log('Hello.')
