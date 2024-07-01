# bundlerで作成するgemを管理する場合はbundle exec
# これをつけないと、gemfileの方じゃなくて、pcを含めたその環境にインストールされている一番新しいジェムが使用される
require 'faker'
require 'awesome_print'

puts Faker::VERSION
puts Faker::Name.name

ap [1,2,3]
