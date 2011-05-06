require 'bundler'
require 'cucumber/rake/task'

desc "Run tests"
task :default => :cucumber

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = "features --format pretty"
end

