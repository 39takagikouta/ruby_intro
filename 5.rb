# ハッシュの繰り返し処理 2パターン
a = {'japan'=>'yen','us'=>'dollar','india'=>'rupee'}

a.each do |a,b|
  puts "#{a}は#{b}という貨幣を使っている"
end

a.each do |a|
  puts "#{a[0]}は#{a[1]}という貨幣を使っている"
end

# ハッシュ同士の比較は、中身が同じなら順番が違うくてもtrue
b = {'japan'=>'yen','india'=>'rupee','us'=>'dollar'}
p a==b
p b.size
b.delete('japan')
p b

# シンボルは文字列と似ているが、いくつかの違いがある
# 1 表面的には文字列と似ているがシンボルは整数なので、処理が文字列より高速
# 2 同じシンボルであれば同じオブジェクトであるので、メモリの使用効率がいい
p :apple.object_id
p :apple.object_id
p :apple.object_id
p 'apple'.object_id
p 'apple'.object_id
p 'apple'.object_id
# 3 イミュータブル　変更されてほしくないときに使う
a = :apple
# a.upcase!
# 名前による識別をしたいが、文字列じゃなくてもいいときにこれを使う。代表例がkey。文字列の場合より高速に取り出せる
# 状態管理にも使える（文字列より処理は高速だし、数字よりわかりやすい）
status = :done

p case status
when :done
  '終わってる'
when :do
  'やっている'
when :todo
  'これからやる'
end

b = {japan:'yen',india:'rupee',us:'dollar'}
b[:italy]='euro'
p b

# キーワード引数。ハッシュと似ているが別物
def buy_burger(menu, drink: true, potato: true)
  p "#{menu}です"
  if drink
    p 'ドリンクです'
  end
  if potato
    p 'ポテトです'
  end
end

buy_burger('ハンバーガー', drink: true, potato: true)
# ハッシュを渡すこともできる
c = {drink: true, potato: true}
buy_burger('ハンバーガー', **c)

# ハッシュでよく使われるメソッド一覧
b = {japan:'yen',india:'rupee',us:'dollar'}
p b.keys
p b.values
p b.has_key?(:japan)
p b.has_key?(:jap)
p c = {italy: 'euro', **b}
p c.merge(b)

# 任意のキーワードを受け付ける**引数
def buy_burger(menu, **others)
  p others
end

buy_burger('ハンバーガー', drink: true, potato: true)

# メソッド呼び出し時に、最後がハッシュであれば{}は省略可能
b = {japan:'yen',india:'rupee',us:'dollar'}
def a(name, options = {})
  p name, options
end
p a('滉太',japan:'yen',india:'rupee')
# # ハッシュリテラルの{}とブロックの{}をrubyが誤って解釈する場合がある
# buy_burger({drink: true, potato: true}, 'fish')
# # 上記のように第一引数にハッシュがくる場合は省略できない
# buy_burger 'fish', {drink: true, potato: true}
# 上記のように第二引数以降なら省略できる。なんなら{}も
# {}付近で構文エラーが発生した場合は()の省略を疑う
puts ({foo: 1, bar: 2})
# puts assert_equal({foo: 1, bar: 2}, result)

# 配列からハッシュに、ハッシュから配列に
b = {japan:'yen',india:'rupee',us:'dollar'}
p c = b.to_a
p d = c.to_h

# ハッシュのデフォルト値を設定する
h = Hash.new('hello')
a = h[:foo]
b = h[:bar]
p a.equal?(b)
# 上記の場合は参照のコピーなので他のやつも変わる。だから下記のようにブロックを使う
h = Hash.new {'hello'}
a = h[:foo]
b = h[:bar]
p a.equal?(b)
# キーが見つからなかったとき、kyeとデフォルトの値を同時に設定
h = Hash.new {|hash, key| hash[key] = 'hello'}
h[:foo]
h[:bar]
p h

p %i(apple orange melon)
# 基本的にシンボルと文字列は別物だが、互換性はあるし同等に扱うこともある（基本は別）
a = 'apple'
# p a.to_sym
p a.respond_to?('include?')
p a.respond_to?(:include?)

# 引数にはいろいろ種類があるが(p199参照)、順番が決まっている

# ボッチ演算子　エラーを回避してnilを返す　下記の二つは同じ
# if currency
#   currency.upcase
# end
# currency&.upcase

# nilガード nilかfalseであれば右辺を代入 begin/endで複数行でデフォルト値を設定もできる
limit = nil
p limit ||= 10
limit = 20
p limit ||= 10
# 上記はlimit || limit = 10 とどうぎ

# 真偽値への方変換
p !1
p !!1
