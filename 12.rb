# ハッシュリテラルの{}の前後でsyntaxerrorが発生した場合は、()の省略のせいでブロックの{}とrubyが理解してしまっている可能性が高い
# putsは返り値がnilだが、pは返り値が引数なので、代入しながらコンソールに表示とかもできる
name = p 'kouta'
name2 = puts 'kei'
p name, name2

# 途中でtapを挟むことでメソッドチェーンの途中の値を確認する
p 'kouta'.chars.map {|a| a*2}.tap{|a|p a}.join
