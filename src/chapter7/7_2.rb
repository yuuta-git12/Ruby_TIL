# Userクラスを定義する
class User
  # last_name,ageの読み取りを許可する(ゲッターメソッド)
  # ゲッターメソッド：インスタンス変数の内容を外部から読み出す
  attr_reader :last_name, :age
  # first_nameの読み書きを許可する(セッターメソッド)
  # セッターメソッド：インスタンス変数の内容を外部から書き込む
  attr_accessor :first_name

  # attr_writer(インスタンス変数の書き込みだけ許可する)

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  # 氏名を作成するメソッド(インスタンメソッド)
  def full_name
    "#{@first_name} #{@last_name}"
  end

  def shuffle_name
    # shuffled_nameはローカル変数(このメソッド内でのみ有効)
    # 同じインスタンスでもhelloメソッドが呼び出されるたびに変数shuffled_nameの値は変わる
    shuffled_name = @first_name.chars.shuffle.join
    "Hello, Iam #{shuffled_name}"
  end

  def hello
    "Hello, Iam #{first_name} #{last_name}"
  end

  # クラスメソッドの定義(頭にselfをつける)
  # 配列users_dataを渡すと、Userクラスのインスタンスを配列に入れて返す
  def self.create_users(users_data)
    users_data.map do |first_name, last_name, age|
      User.new(first_name, last_name, age)
    end
  end

end

###################

alice = User.new('Alice', 'Ruby', 20)
bob = User.new('Bob', 'Python', 30)

puts alice.full_name

puts bob.full_name

###################
puts alice.hello

puts alice.hello

puts alice.first_name

###################
users_data = [['Taro', 'Suzuki', 23], ['Jiro', 'Suzuki', 21], ['Saburo', 'Suzuki', 19]]

users = User.create_users(users_data)

users.each do |user|
  puts user.hello
  puts user.age
end
