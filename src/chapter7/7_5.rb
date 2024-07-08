class User
  attr_accessor :name
  # attr_reader :name

  def initialize(name)
    @name = name
  end

  def hello
    # selfなしでnameメソッドを呼び出す
    puts "Hello, I am #{name}."
  end

  def hi
    # self付きでnameメソッドを呼び出す
    puts "Hi, I am #{self.name}."
  end

  def my_name
    # 直接インスタンス変数の@nameにアクセスする
    puts "My name is #{@name}"
  end

  def rename_to_bob
    # メソッド内でセッターメソッドを呼び出す場合はselfを付ける
    self.name = 'Bob'
  end

  def rename_to_carol
    # self付きでname=メソッドを呼ぶ
    self.name = 'Carol'
  end

  def rename_to_dave
    # 直接インスタンス変数を書き換える
    @name = 'Dave'
  end
end

user = User.new("Alice")
# user.hello
# user.hi
user.my_name

puts user.rename_to_bob
puts user.rename_to_carol
puts user.rename_to_dave

# ***********************************************************
class Foo
  # このputsはクラス定義の読み込み時に呼び出される
  3.times do
    puts "クラス構文の直下のself: #{self}"
  end

  def self.bar
    puts "クラスメソッド内のself: #{self}"
    # エラーになるコード クラスメソッドからインスタンスメソッドを呼び出す
    # self.baz
  end

  def baz
    puts "インスタンスメソッド内のself: #{self}"
    # エラーになるコード　 インスタンスメソッドからクラスメソッドを呼び出す
    # self.bar
  end
end

Foo.bar
foo = Foo.new
foo.baz
# ***********************************************************
# クラスメソッドをインスタンスメソッドで呼び出す

class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  # 金額を整形するメソッド(クラスメソッド)
  def self.format_price(price)
    "#{price}円"
  end

  def to_s
    # インスタンスメソッドからクラスメソッドを呼び出す
    formatted_price = Product.format_price(price)
    "name: #{name},price: #{formatted_price}"
  end
end

product = Product.new('A great movie', 1000)
puts product.to_s
