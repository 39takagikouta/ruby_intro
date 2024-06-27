# 例外もオブジェクトだからメソッドが使える　例外を限定することもできるし、複数設定もできる
begin
  'abc'.foo
rescue NoMethodError, ZeroDivisionError => e
  puts "#{e.class}:#{e.message}"
  puts e.full_message
ensure #ここの処理はエラーが出ようと出なかろうと確定で実行される
  puts 'ensureのやつ'
end
