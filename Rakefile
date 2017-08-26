#! /usr/bin/env ruby
require 'rake'

task default: [ :build, :install, :test ]

task :build do
  sh 'gem build *.gemspec'
end

task :install do
  sh 'gem install rspec --no-force'
  sh 'gem install *.gem'
end

task :test do
  FileUtils.cd 'spec' do
    Dir['*.rb'].each { |spec| sh "rspec #{spec} --backtrace --color --format doc" }
  end
end
