# namespace :my_task do
#   desc 'テスト用のタスク'
#   task :hello_world do
#     puts 'Hello world'
#   end
# end

# DSL
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = '*_test.rb'
end

task default: :test
