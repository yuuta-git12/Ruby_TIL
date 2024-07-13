=begin
クラスインタス変数
=end
class Product
  # クラスインスタンス変数
  # クラス自身が欲しじているデータ(クラス自身のインスタンス変数)
  # オブジェクトの作成とは無関係
  @name = 'Product'
  def self.name
    # クラスインスタンス変数
    @name
  end

  def initialize(name)
    # インスタンス変数(クラスをインスタンス化(クラス名.newで
    # オブジェクトを作成))した際にオブジェクトごとに管理される変数
    @name = name
  end

  def name
    # インスタンス変数
    @name
  end
end

class DVD < Product
  @name = 'DVD'
  def self.name
    # クラスインスタンス変数を参照
    @name
  end

  def upcase_name
    # インスタンス変数を参照
    @name.upcase
  end
end

p Product.name
p DVD.name # クラスインスタンス変数が参照される

product = Product.new('A greadt movie')
p product.name # インスタンス変数が参照される

dvd = DVD.new('An awesome film')
p dvd.name # インスタンス変数が参照される
p dvd.upcase_name # インスタンス変数に対して、メソッドが実行される

p Product.name # クラスインスタンス変数が参照される
p DVD.name # クラスインスタンス変数が参照される

=begin
クラス変数
=end
class ProductClassVariable
  @@name = 'Product'
  def self.name
    @@name
  end

  def initialize(name)
    @@name = name
  end

  def name
    @@name
  end
end

class DVDClassVariable < ProductClassVariable
  @@name = 'DVD'

  def self.name
    @@name
  end

  def upcase_name
    @@name.upcase
  end
end

p '#######'

# DVDClassVariableを定義したタイミングで@@nameがDVDに変更される
ProductClassVariable.name # =>DVD
DVDClassVariable.name # =>DVD

product_class_variable = ProductClassVariable.new('A great movie')
p product_class_variable.name

p ProductClassVariable.name
p DVDClassVariable.name

dvd_class_variable = DVDClassVariable.new('An awesome film')
p dvd_class_variable.name
p dvd_class_variable.upcase_name

p product_class_variable.name
p ProductClassVariable.name
p DVDClassVariable.name

=begin
グローバル変数と組み込み変数
=end
# グローバルヘンスの宣言と値の代入
$program_name = 'Awesome program'

# グローバル変数に依存するクラス
class Program
  def initialize(name)
    $program_name = name
  end

  def self.name
    $program_name
  end

  def name
    $program_name
  end
end

# $program_nameにはすでに名前が代入ずみ
p Program.name

program = Program.new('Super program')
p program.name

p Program.name # Program.newのタイミングで$program_nameの中身が変更される
p $program_name
