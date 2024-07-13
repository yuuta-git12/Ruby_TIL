class Product
  attr_reader :name, :price

  def initialize(name,price)
    @name = name
    @price = price
  end
  # Objectクラスにあるto_sメソッドをオーバーライド
  def to_s
    "name: #{name},price: #{price}"
  end
end

class DVD < Product
  # name、priceは親クラスでattr_readerが設定されているので不要
  attr_reader :running_time

  def initialize(name, price, running_time)
    # スーパークラスにも存在している属性
    # @name = name
    # @price = price
    super(name, price)  # 上2行と同じ処理 superでも可
    # DVDクラス独自の属性
    @running_time = running_time
  end

  # #{super}で親クラスのto_sメソッドを呼び出す
  def to_s
    "#{super}, running_time: #{running_time}"
  end
end

product = Product.new('A great movie', 1000)
p product.name
p product.price
p product.to_s

dvd = DVD.new('A great movie', 1000, 120)
p dvd.name
p dvd.price
p dvd.running_time
p dvd.to_s
