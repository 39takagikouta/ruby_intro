# 日付を表すオブジェクト
# +09:00はタイムゾーン（パソコンやサーバに設定されている時差情報のこと）
# Datetimeクラス（現在は非推奨）はタイムゾーンが0000
require 'date'
p time = Time.new(2024,6,30,22,50)
p date= Date.new(2024,6,30)
p datetime= DateTime.new(2024,6,30,22,50)
lambda(&proc{})

puts File.exist?('./10.rb')
# File.open('/10.rb', 'w') do |f|
#   f.puts 'hello world!'
# end

require 'json'

user = [name: 'kouta', age: 25]

p user.to_json.class

# 環境変数と起動時引数

# name = ENV['MY_NAME']
# age = ARGV[0]
# puts "#{name},#{age}"

# rubyのコードとして実行
code = '[1,2,3].map {|a|a*2}'
eval(code)
# バッククオートはosコマンドでそれを実行
# puts `cat 13.rb`

require 'faker'
puts Faker::Name.name
puts Faker::Name.name
