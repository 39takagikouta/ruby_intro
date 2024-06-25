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

end

user = User.new('kouta')
user2 =User.new('kakaka')
p user.name
p user2.name
p user.name = 'かかか'
# 外からインスタンスの中身を変更できなくするにはどうするんや？
names = ['kouta', 'takagi']
users = User.create_users(names)
users.each {|user| p user.name}
p user.price
