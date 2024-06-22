require 'date'
#二章
a, b = 1, 10
puts a, b

c = d = 'iii'
c.upcase!
p c, d

puts 'こんにちは\n赤ちゃん'
puts "こんにちは\n#{c}"
p "こんにちは\n赤ちゃん"

n = 2
n**= 3
puts n
#式展開を使った場合は自動的にto_s
#少数を使う場合は丸め誤差に注意

#falseとnilが偽（nilもなところに注意）　rubyではnilもfalseであることを生かしたコードがめっちゃ出てくる
puts true == nil

t1 =true
f1=true
puts t1 || f1
puts !(t1 || f1)

#rubyもif文変数に入れられるんや
puts "aaa" if t1

#%!!を使ったらシングルクオートやダブルクオートをバックスラッシュでエスケープしなくても良くなる
puts %!お前は'あ'だ!
puts '!お前は\'あ\'だ'
#シングルクオートやダブルクオートの他に、%記法やヒアドキュメントなどもある

def some_method
  <<~TEXT
  おはよう
  こんにちは
  こん\nばんは
  TEXT
end

puts some_method

#フォーマット指定文字列
puts sprintf('%0.3f', 1.2)
puts '%0.3f'% 1.2

#指数表現
puts 2e-1

#短絡評価を用いたコード例 &&なら偽の時点で終了　||なら真の時点で終了　&&の方が||より優先
#and orとかもあるが上二つより優先順位が低い
# user = User.find(name: "花子") || User.find(name: "亮")
country = 'japan'
message =
  case country
  when  'japan'
    'こんにちは'
  when  'america'
    'hello'
  else
    '?'
  end
puts message

puts country != 'japan' ? '日本' : '日本じゃない'

#述語メソッド
puts 'kouta'.include?('ta')

#エンドレスメソッド
def multiple_of_three(num) = num % 3 == 0

puts multiple_of_three(6)

#式は値を返す　文は値を返さない　if文は値を返すから実は式　メソッドもjsの関数みたいに代入できるから式

#擬似変数たち
puts self
puts __FILE__
puts __LINE__
puts __ENCODING__

#参照はrubyにもある　jsと仕組みは同じ
puts Date.new

# puts.print,pの違い
# Putsは改行がある　戻り値はnil
# Printは改行がない　戻り値はnil
# Pは改行がある　戻り値は渡されたオブジェクト　\nの改行が使えない
# ppはハッシュや配列を整形して表示してくれる
