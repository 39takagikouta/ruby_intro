class User
  # 定数
  DEFAULT_PRICE = 0
  # これでゲッターセッターまとめて定義してくれる
  attr_accessor :name, :price

  # これはデフォルトでprivateメソッド
  def initialize(name, price = DEFAULT_PRICE)
    @name = name
    @price = price
  end

  # インスタンスメソッド
  def hello
    # ローカル変数は定義されていない段階で呼ばれたらエラーが出るが、インスタンス変数は違う
    p "#{@name},hello"
  end


  # インスタンス変数はクラスの外部から参照できない（user.nameとかができない）。だからこのようにメソッド定義する必要がある（ゲッターメソッド）
  # これrailsやったらデフォルトでやってくれてるんやな
  # def name
  #   @name
  # end
  # # =で終わるメソッドを定義すると、代入する感じでそのメソッドを呼び出せる（セッターメソッド）二つ合わせてアクセサメソッド
  # def name=(value)
  #   @name = value
  # end

  def self.create_users(names)
    names.map do |name|
      User.new(name)
    end
  end
# インスタンスメソッドは下記の3種類
  def hello
    "Hello, I am #{name}"
  end
  def hi
    "Hi, I am #{self.name}"
  end
  def ora
    "ora, I am #{@name}"
  end
  # 正、セッターメソッドだけは一つ目の書き方じゃだめ selfをつける
  def rename
    name = 'bob'
  end
  # クラス定義時に実行してほしいコードを書くこともできる
  puts self

  # クラスメソッドで最初にselfとつけるのは、それがclassインスタンスを返すから
end

# user = User.new('kouta')
# user2 =User.new('kakaka')
# p user.name
# p user2.name
# p user.name = 'かかか'
# # 外からインスタンスの中身を変更できなくするにはどうするんや？
# names = ['kouta', 'takagi']
# users = User.create_users(names)
# users.each {|user| p user.name}
# p user

# クラスの継承をするかは機能ではなく概念で考える
# 「サブクラスはスーパークラスの一種である」という文章に当てはめた際に違和感がなかったらまる　大集団と小集団の関係だったらまる
# objectクラスが頂点と考える　rubyは基本は単一継承
p User.superclass
p User.new("kouta").methods.sort
user = User.new("kouta")
p user.instance_of?(User)
p user.is_a?(Object)
p user.is_a?(Integer)
