# # yieldの使い方
# def greet
#   puts 'おはよう'
#   if block_given?
#     text = yield 'ご馳走様'
#     puts text
#   end
#   puts 'こんばんは'
# end

# greet do
#   puts 'こんにちは'
# end

# greet do
#   puts 'こんにちは'
# end
# greet
# greet do |a|
#   a*2
# end

# # putsとかは全てObjectクラスにincludeされているKernelメソッドのインスタンスメソッド
# # トップのコンテキストはObjectクラスのインスタンスメソッドであるmainオブジェクトのインスタンスメソッドのスコープなので、これらが使える
# # だから本当はputsとかの前にself.が省略されている
# self.puts('kouta')

# class User
#   puts self
# end

# ブロックを引数として明示的に渡すこともできる。正その際は、ブロックは一つしか渡せず、また他の引数の最後に書かないといけない
def greet(&block)
  puts 'おはよう'
  block_given?
  unless block.nil?
    text = block.call('こんにちは')
    puts text
  end
end

greet do |text|
  text * 2
end

greet

# このメリット1 ブロックを他のメソッドの引き渡せる 下記の場合は呼び出しもと→greet_js→greet_commonへバケツリレーしている
def greet_ja(&block)
  texts = ['こんにちは','こんばんは']
  greet_common(texts, &block)
end
def greet_en(&block)
  texts = ['Hello','Good evening']
  greet_common(texts, &block)
end

def greet_common(texts, &block)
  puts texts[0]
  puts block.call(texts[1])
end

greet_ja do |text|
  text.upcase
end
greet_en do |text|
  text.upcase
end

# メリット2 渡されたブロックに対してメソッド（今回はarity）を呼び出して、情報を取得したり操作したりすることができる
def greet(&block)
  puts 'おはよう'
  text =
  if block.arity == 1
    yield 'こんにちは'
  elsif block.arity == 2
    yield 'こん','ちくわ'
  end
  puts text
  puts 'こんばんは'
end

greet do |text|
  text * 2
end

greet do |text1, text2|
  text1 * 2 + text2 * 2
end

# Procクラスはブロックをオブジェクト化するためのクラス
# artiyもここで定義されている
# jsの関数オブジェクトに近く、実行されない限りはなんの意味もない（jsの場合は()をつけることで実行されるが、Procの場合はcallで実行される）
add_proc = Proc.new { |a,b| a+b }
add_proc = proc { |a,b| a+b} #Kernelオブジェクトのprocメソッドでもいい
puts add_proc.call(1,2)

# ブロックとProcオブジェクトは違う　ブロックをオブジェクト化したものがProcオブジェクト
# さっきまで引数にブロックを渡していたが、その際にProcオブジェクト化していた　だからcallが使えた
# ブロックを直接引数として渡していたが、procオブジェクトでもいい &をつけたらブロックとして渡されるが
def greet(&block)
  puts 'おはよう'
  block_given?
  unless block.nil?
    text = block.call('こんにちは')
    puts text
  end
end

proc = proc {|a| a*2 }
greet(&proc)

# Procオブジェクトとして、&をつけずに渡すのであれば複数個渡せるし、ブロックとして渡した時と処理は変わらない
def greet(proc, proc2, proc3)
  puts proc.call
  puts proc2.call
  puts proc3.call
end

proc = proc { 'おはよう' }
proc2 = proc { 'こんちは' }
proc3 = proc { 'ばんわ' }
greet(proc, proc2, proc3)

# 下記はラムダと言って、Procオブジェクトだし挙動は同じだが、普通のメソッドのように引数の数に厳格な点が異なる
# 違いはこれだけ覚えておけば大丈夫
lambda = ->(a,b) {a.to_i+b.to_i}
lambda = lambda {|a,b|a.to_i+b.to_i}
puts lambda.call(1,2)
puts lambda.lambda?
puts proc.lambda?
