# メソッドの公開レベル
class User
  # デフォルトはpublic
  def hello
    p 'hello'
    # Ruby2.7からはselfをつけて呼び出せる Ruby2.6まではselfを付けるとエラーになる
    private_hello
  end

  # ここから下で定義されたメソッドはprivate
  private

  def private_hello
    'private hello'
  end

  # ここから下で定義されたメソッドはpublic(ただし、普通はprivateを1回だけにして)
  # クラスの最後の方にprivateキーワードを書く
  public

  def public_hello
    'public hello'
  end
end

user = User.new
# publicメソッド　クラスの外から呼び出せる
p user.hello

p user.public_hello

#######################################

class Product

  def to_s0
    "name: #{name}"
  end

  private
  # privateメソッド
  def name
    'A great movie'
  end
end

class DVD < Product
  def to_s
    # nameは親クラスのprivateメソッド
    "name: #{self.name}"
  end

  def name
    'An awesome film'
  end
end

product = Product.new
p product.to_s0

dvd = DVD.new
# 内部で親クラスのprivateメソッドを読んでいるがエラーにならない
p dvd.to_s
p dvd.to_s0

##########################################
class User2

  private
  # クラスメソッドはprivateメソッドにならない
  def self.hello
    'Hello!'
  end
  # class << self構文ならクラスメソッドでもprivateが機能する　
  # 「private_class_method :メソッド名」と書くと後からprivateに変更できる
  class << self
    private
    # クラスメソッドはprivateメソッドにならない
    def hello2
      'Hello!'
    end
  end
end

# クラスメソッドはprivateメソッドにならない→呼び出せてしまう
p User2.hello
# p User2.hello2

##########################################
class User3
  # この時点ではpublicメソッドとして定義されている
  def foo
    'foo'
  end

  def bar
    'bar'
  end

  # fooとbarをprivateメソッドに変更
  private :foo, :bar

  # bazはpublicメソッド
  def baz
    'baz'
  end
end

user3 = User3.new
# p user3.foo # エラー
# p user3.bar # エラー
p user3.baz

=begin
protectedメソッドに関するノート
=end
class User4
  # weightは外部に公開しない
  attr_reader :name

  # protected 方法2
  # ruby3.0以上ならこれでも良い
  # weightメソッドの定義と同時にprotectedメソッドにする
  protected attr_reader :weight

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  # 自分がother_userより重い場合はtrue
  def heavier_than?(other_user)
    other_user.weight < @weight
  end

  #protected 方法1
  # protected

  # # protectedメソッドにすることで、同じクラスか子クラスのインスタンスメソッドであればレシーバ付きで呼び出せる
  # def weight
  #   @weight
  # end
end

alice = User4.new('Alice',50)
bob = User4.new('bob',60)

p alice.heavier_than?(bob)
p bob.heavier_than?(alice)

# クラスの外ではweightは呼び出せない
p alice.weight
