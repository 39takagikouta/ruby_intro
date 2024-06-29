# procオブジェクトを実行する方法一覧
add_proc = proc {|a,b|a+b}
puts add_proc.call(10,20)
puts add_proc.yield(10,20)
puts add_proc.(10,20)
puts add_proc[10,20]
puts add_proc===[10,20] #whenでProcオブジェクトが使えるようにこれでもできるようになっている

# シンボルもto_procメソッドを使える　メソッド名のシンボルにすることで、そのメソッドが入ったprocオブジェクトになる
# call時の第一引数はレシーバになり、第二引数以降はメソッドの引数になる
# 下記のような書き方もこの理屈で説明することができる
puts ['ruby','java','python'].map(&:reverse)

# Procオブジェクトはクロージャ（生成時のコンテキスト（変数情報など）を保持している関数のこと）　中にローカル変数や引数の情報かのこる
def generate_proc(array)
  counter = 0
  Proc.new do
    counter += 10
    array << counter
  end
end

values = []
sample_proc = generate_proc(values)
sample_proc.call
puts values
sample_proc.call
puts values
sample_proc.call
puts values
