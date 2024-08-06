=begin
独自に作成したクラスへのエイリアスメソッドの定義
=end
class User
  def hello
    'Hello'
  end

  # helloメソッドのエイリアスメソッドとしてgreetを定義する
  # 必ず先に元になるメソッドを定義しておくこと
  alias greet hello
end

user = User.new
p user.hello
p user.greet

=begin
メソッドの削除
=end
class User_undef
  # スーパークラス(Objectクラス)で定義されているfreezeメソッドを削除する
  undef freeze
  def hoge
    'hoge'
  end
end

user_undef = User_undef.new
# クラス内のメソッドにfreezeが含まれているか確認
# 含まれている場合true
# 含まれていない場合false
p User_undef.methods.include?(:freeze) # true
p user_undef.methods.include?(:freeze) # false インスタンスではfalseになる

# freezeメソッドを呼び出すとエラーになる
# user_undef.freeze

=begin
入れ子になったクラスの定義
=end
class UserNest
  class BloodType
    attr_reader :type

    def initialize(type)
      @type = type
    end
  end
end
# クラスの内部に定義したクラスを参照する場合は
# 外側のクラス::内側のクラス　とかく
blood_type = UserNest::BloodType.new('B')
p blood_type.type

=begin
演算子の挙動を独自に再定義する
=end
class UserRedifinition
  # =で終わるメソッドを定義
  def name=(value)
    @value = value
  end
end
user_redifinition = UserRedifinition.new
# 変数に際代入するような形式でname=メソッドを呼び出せる
user_redifinition.name = 'Alice'
