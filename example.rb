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
