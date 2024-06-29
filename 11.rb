# パターンマッチとは、配列や八種の構造をパターン化して条件分岐させるものであり、代入演算子を使わずに条件分岐内でローカル変数の宣言と代入ができるもの
# パターンマッチも===で判定している
require 'date'

records = [
  [2021],
  [2022, 4],
  [2023, 9, 5],
]

new_records = records.map do |record|
  case record
  in [y]
    Date.new(y,1,1)
  in [y,m]
    Date.new(y,m,1)
  in [y,m,d]
    Date.new(y,m,d)
  end
end

p records, new_records

# ガード式
data = [[1,2,3],[4,5,6]]
data.each do |numbers|
  case numbers
  in [a,b,c] if b == a+1&&c==b+1
    puts "matched: #{numbers}"
  end
end

# 一行パターンマッチ
a = ([1,2,3] in [String,Integer,Integer])
puts a
# その中の右代入
123 => n
puts n

# パターンマッチはスコープを作らないため、その中で作ったローカル変数が外で使えてしまう　意図せずに上書きしないように注意
