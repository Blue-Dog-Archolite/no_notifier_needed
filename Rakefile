#!/usr/bin/env rake
# encoding: utf-8

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end


require 'bundler/gem_helper'
Bundler::GemHelper.install_tasks(:name => 'no_notifier_needed')

require 'metric_fu'
MetricFu::Configuration.run do |config|
  config.rcov[:rcov_opts] << "-Itest" # Needed to find test_helper
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'NoNotifierNeeded'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/test_*.rb'
  t.verbose = true
end

task :default => :test

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "no_notifier_needed"
  gem.homepage = "http://github.com/Blue-Dog-Archolite/no_notifier_needed"
  gem.license = "MIT"
  gem.summary = %Q{A Gem used to remove ActionMailer::Base class and and provide Templates}
  gem.description = %Q{A work in progress: Replace ActionMailer::Base class redundency. Temlating using haml or erb.}
  gem.email = "Blue.Dog.Archolite@gmail.com"
  gem.authors = ["Robert R. Meyer"]
  # dependencies defined in Gemfile
end

Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test
#!/usr/bin/env rake

