# a = [1,2,3]
# a[4]=5
# p a
# a<<6
# p a
# a.delete_at(3)

# #多重代入
# quo,rem = 14.divmod(3)
# p quo, rem

# # rubyではforはほとんど使わず、eachなどを使う
# # ブロックとはeach文のdo~endの部分
# # jsで言うところのコールバック関数（正rubyはブロック一つだけしか入れられない）
# # 用件をと和す共通する処理はメソッド自身に（順番に取り出すとか）、用件によって異なる処理はブロックに担当しているメソッドがrubyは多い
# # doとendではなく、{}を使うこともできる。これは処理を一行で書くときに用いれる。mapとかでよく使う

# a.delete_if do |n|
#   n.nil?
# end

# p a

# sum=0
# a.each {|n| sum+=n}
# p sum

# #下記二つのコードは同義
# arr = []
# a.each {|n| arr<< n*10}
# p arr

# arr2 = a.map {|n| n*10}
# p arr2

# new_arr = arr.select {|n| n % 3 == 0}

# p new_arr

# chars = ['a', 'b', 'c']
# p chars.sum('')
# # 基本的に上記の処理はjoinメソッドでやった方がいいが、初期値をつけたい時や処理内で文字列を加工したいときにはsum

# arr3 = [1,2,3,4,5,6]

# # 特定の条件下で、ブロックを渡す代わりに&:メソッド名と言う引数を渡すことができる
# # 1ブロックパラメーター（引数とは違う）が1個だけである　2処理の中に引数がない　3一行しかない　上記の条件が揃ったときにのみ使用できる
# p arr3.select {|n| n.even?}
# p arr3.select(&:even?)

# p (1..6).class
# # argmentとは引数　https://qiita.com/yait/items/444061a7decb3f7fd627
# # もしかっこで囲わなかったら、..よりメソッドの方が優先順位が高いため、先にclassメソッドが動いてしまう

# # 範囲オブジェクトを使うと一括取得も可能
# p arr[1..3]
# p 'apple'[1..3]

# # 以上以下も表せる
# def liquid?(a)
#   (0...100).include?(a)
# end

# p liquid?(7)
# p liquid?(107)

# def charge(age)
#   case age
#   when 0..5
#     0
#   when 6..17
#     100
#   else
#     200
#   end
# end

# p charge(1)
# p charge(10)
# p charge(100)

# # 値が連続する配列の作成
# p (0..10).to_a
# p ('a'..'d').to_a
# p [*0..10]

# # 添字を二つ使うと、番号だけでなく取得する長さも指定することができる
# m = [1,2,3,4,5,6]
# # 複数の要素を一括取得
# p m.values_at(0,2)
# # 最後の値を取得
# p m[-1]
# p m.last
# # 最後から2こを取得
# p m.last(2)
# # pushメソッドは<<と同じ。こっちは一括追加もできる
# p m.push(7,8)
# p m.delete(8)
# # +とconcatは同じだが、後者は破壊的。基本は+を使用する
# a = [1,2]
# b = [1,2]
# p a.concat(b), a, b
# # 和集合・積集合・差集合
# a = [1,2,3]
# b = [3,4,5]
# p a|b
# p a-b
# p a&b
# # 多重代入で余った分を全て配列にする
# a,*b = 100,200,300
# p a, b
# # 途中でもできる
# a,*b,c,d = 100,200,300,400,500
# p a,b,c,d
# # 右辺が少なかったら、空の配列は*が引き受けれる
# a,*b,c,d = 100,200,300
# p a,b,c,d
# # 配列を分割して他の配列に入れるときは*をつける(これはwhen節でも使える（そもそもwhenの条件って二つ設定できるんや）)
# a = [1,2,3]
# b = [0]
# b.push(a)
# p b
# a = [1,2,3]
# b = [0]
# b.push(*a)
# p b
# # 引数を自由個数取ることができる可変長引数を持つメソッドを作りたい場合は、引数の前に*（多重代入時と考え方は同じ）
# # この場合配列で渡ってくる
# def hello(*name)
#   "#{name.join('と')}、こんばんは"
# end

# p hello('滉太','髙木')
# # jsのスプレッド構文と同じ
# a= [2,3]
# p [0,1,*a,4,5]
# # 下記でも配列を作れる　クオーテーションがいらないから描きやすい(%記法)
# p %w(apple melon orange big\ apple) #\で改行あり
# p %w!apple melon orange!
# # 文字列を配列に変換
# p 'ruby'.chars
# p 'ruby.java.php'.split('.')
# # 配列にデフォルト値を設定。ただし全て参照が同じ点は注意
# a = Array.new(5,'default')
# a[0].upcase!
# p a
# # 引数ではなくブロックでデフォルト値を渡せば解決（今回はブロックパラメータは省略されている）
# a = Array.new(5) {'default'}
# a[0].to_s
# p a
# # 例えば上記の配列の要素が、数字はboolean、範囲やnilであった場合それはイミュータブル（変更不可な値）のため、破壊的な変更はできない。この場合はブロックでわざわざデフォルト値を設定しなくてもいい
# # stringはミュータブル（変更可能）な値
# # 添字とはインデックスのこと

# # with_indexメソッドはeachだけでなく他のループ処理メソッドにも使える
# # enumeratorクラスに使える　基本ループ処理のメソッドはブロックなしで呼び出すとこのクラスの値を返すから
# p ['apple','melon','orange'].map.with_index {|fruit, i| "#{i}:#{fruit}"}
# p ['apple','melon','orange'].map
# # 添字の始まりは設定できる
# # ただし、each_with_indexは添字が設定できないため、each.with_indexにする必要がある
# p ['apple','melon','orange'].map.with_index(10) {|fruit, i| "#{i}:#{fruit}"}
# # ブロックパラメータに配列を渡す場合は、引数を複数用意することで、配列の要素をそれぞれ受け取れる
# [[0,1],[2,3],[4,5]].each do |a,b|
#   puts a,b
# end
# # 添字を使う際は、配列の要素を受け取るブロックパラメータを格好で閉じる必要がある
# [[0,1],[2,3],[4,5]].each_with_index do |(a,b),i|
#   puts "#{a},#{b},#{i}"
# end
# 番号指定パラメータは記述量が減って便利だが、可読性があまり高くないためirbなどで使う。実務で使う際は吟味が必要
# [[0,1],[2,3],[4,5]].each do
#   puts _1,_2
# end

# File.open('/sample.txt', 'w') do |file|
#   file.puts('4.rbから')
# end

# do..endと{}は後者の方が結合度が強い。故に、引数の格好を省略できない。また、do..endの場合は指定した値が見つからない時の戻り値を変更できる
# a = [1,2,3,4,5,6]
# a.delete 100 do
#   'NG'
# end

# # 範囲オブジェクトの始点か終点を書かないこともできる
# p a[..3]

# 他にも、times（単純に指定の回数を繰り返す）やupto(nからmまで繰り返す)などもある
# 10.upto(14) do |a|
#   puts a
# end
# 1.step(10, 3) {|n| puts n}
# # while,until,forなどもあるが、rubyでは基本はeachやmapのような繰り返し用メソッドの方を使う
# # ただし、これらは中で設定した変数が外でも使えるという違いはある
# # Kernelモジュールのloopメソッドとブロックを用いたループ処理
# loop do
#   b = a.sample
#   puts b
#   break if b ==3
# end
# 再帰呼び出し
def fac(n)
  n>0 ? fac(n-1) : 1
end
p fac(5)
# 配列だけでなく、範囲オブジェクトやuptoメソッドの戻り値など、繰り返し処理ができそうなオブジェクトであれば大半使える
# mapやeachはarrayクラスではなくenumerableモジュールに定義されていて、上記は全てenumerableモジュールをインクルードしているから
# 公式リファレンスでメソッドを調べるときは、arrayだけでなくenumerableモジュールのやつも調べる

# 繰り返し処理の制御
# breakで脱出できる。戻り値も設定できる
a = [1,2,3,4,5,6]
loop do
  b = a.sample
  puts b
  break('終わり') if b ==3
end

# breakと違い、throwメソッドとcatchメソッドを使ったら大域脱出できる
# また、他の言語と違ってrubyではこの二つは例外処理とは関係がない。rubyでは例外処理はraiseとrescueを使う
fruits = ['apple','orange']
numbers = [1,2,3]
catch :done do
  fruits.shuffle.each do |fruit|
    numbers.shuffle.each do |number|
      puts fruit, number
      if fruit == 'orange' && number == 1
        throw :done, '終わり'
      end
    end
  end
end

# 他にはnext（強制で次へ）やredo（やり直し）もある
