# モジュールをクラスにincludeすることを「ミックスいん」という
module Loggable

end

class Product
  include Loggable
end

puts Product.include?(Loggable)
puts Product.new.class.include?(Loggable)
puts Product.included_modules
puts Product.ancestors
product = Product.new
# 自クラス、親クラス、includeしているモジュールだったらtrue
p product.is_a?(Loggable)
p Array.include?(Enumerable), Range.include?(Enumerable)
# include先のメソッドを使っているモジュール
# 1 Enumerableモジュール　何かしらの繰り返し処理ができるクラスにincludeされている
# map,select,find,countとか　これらは内部的にeachを使っているので独自のクラスでもeachを実装したらenumerableをincludeできる
# 2 Comparableモジュール　演算子　<=>を定義しておく必要がある
class Tempo
  include Comparable
  attr_reader :bpm

  def initialize(bpm)
    @bpm = bpm
  end

  def <=>(other)
    other.is_a?(Tempo) ? bpm <=> other.bpm : nil
  end

  def inspect
    "#{bpm}bpm"
  end
end

p Tempo.new(120) == Tempo.new(120)
p Tempo.new(150) == Tempo.new(120)
# sortメソッドの中でも<=>が動いている
p [1,3,2,6,4,9].sort
#  Kernelモジュールはobjectクラスにincludeされている
#  トップレベルのselfはmainオブジェクト（Objectクラスのインスタンス）なので、pやloop,requireといったメソッドが使用できる
#  当然classクラスもmoduleクラスもobjectクラスを引き継いでいるので、これらは使える
p self

module A
end

# p A.superclass

class AB
  p self
  p self.class
  p self.ancestors
end

# モジュール内で定義したメソッドで直接インスタンス変数の中身を変えない方がいい。下記のようにセッターメソッドを経由する
module NameChange
  def change_name
    self.name = "アリス"
  end
end

class User
  include NameChange

  attr_accessor :name

  def initialize(name)
    @name = name
  end
end
# includeはインスタンスメソッド、extendはクラスメソッド

# モジュールのもう一つの用途　名前空間　クラス名の衝突を防いだり、コードを整理したりする
module Baseball
  class Second
    def initialize(player, uniform_number)
      @player = player
      @uniform_number = uniform_number
    end
  end
end

module Clock
  class Second
    def initialize(degits)
      @degits = degits
    end
  end
end

# Baseball::second.new('kouta', 21)
# Clock::second.new(13)

# 他のファイルでは、このような呼び出し方もできる
class Clock::First
  def initialize(degits)
    @degits = degits
  end
end

# 下記二つは参照の順序が異なる　一つ目は最初にClock::Secondを参照し、次にClockを参照する。しかし後者は最初にClock::Secondを参照し、次にObjectを参照する
module Clock
  class Second
    def initialize(degits)
      @degits = degits
    end
  end
end

class Clock::Second
  def initialize(degits)
    @degits = degits
  end
end

# 特異メソッドを定義しまくって、クラスのようにインスタンスを作る予定がない単なるメソッドの集まりとしても使える
module Loggable
  def log(text)
    puts "[log] #{text}"
  end
  # 下記のようにすることで、ミックスインとしても特異メソッドとしても使えるようになる（モジュール関数）
  module_function :log
end

Loggable.log("ohayou")

class User
  include Loggable

  def title
    log 'title is called'
  end
end

# p User.new('kouta').title
# # ミックスインされるとprivateメソッドになる
# # p User.new('hantarou').log('ohayou')

# # 組み込みライブラリであるMathモジュールで定義されているメソッドは基本的にモジュール関数
# p Math.sqrt(9)

# # Kernelモジュールもモジュール関数
# Kernel.p 'kouta'

# クラスインスタンス変数を使って、状態を保持させることもできる
# クラスでもできるが、インスタンス化する予定がないならmoduleの方がわかりやすい
module Kappa
  @name = "kakaka"
  class << self #モジュールの中でクラスインスタンス変数作ろうと思ったらこれがいるんか
    attr_accessor :name
  end
end

Kappa.name = "jajaja"
p Kappa.name

# まとめ　使い方は下記の四パターン
# 1　メソッド定義
# 2　名前空間
# 3　関数や定数を提供（特異メソッドとモジュール関数）
# 4　状況を保持する
