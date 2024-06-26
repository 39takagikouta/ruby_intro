class Product
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "#{name},#{price}"
  end

  # メソッドは返り値としてメソッド名のシンボルを返すので、これでもいい
  private def hello
    p 'hello'
  end
end

class DVD < Product
  attr_accessor :running_time

  # superで親クラスのinitializeメソッドを呼び出す（引数が同じならsuperの引数もいらない、てかそもそもそもinitializeがいらない）
  def initialize(name, price, running_time)
    super(name, price)
    @running_time = running_time
  end

  # superはそれ以外のメソッドでも使える。
  def to_s
    "#{super},#{running_time}"
  end

# 内部からスーパークラスのprivateメソッドも呼び出せる
  def hello2
    self.hello
  end
  # クラスメソッドはprivateの下に書いてもプライベートメソッドにならない　下記のように書く必要がある
  class << self
    private
    def hello
      'hello'
    end
  end
end

DVD.new('kouta', 100 ,120).hello2
dvd1 = DVD.new('kouta', 100 ,120)
dvd2 = DVD.new('kouta', 100 ,120)
binding.irb
p dvd1 == dvd2

# # == === 違い
# 前者は等価演算子、後者はケース等価演算子と言って、主にケース文や特定の条件をチェックするために使われ、範囲、クラスチェック、正規表現など、オブジェクトの特定の性質を判定するために使われます。
# protected違い
