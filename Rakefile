# frozen_string_literal: true

require 'rubygems'
require 'rake'
require 'rake/clean'
require 'rspec/core/rake_task'
require 'rake/testtask'

task default: %i[clean spec rubocop]

desc 'Run all unit tests'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.rspec_opts = '--warnings'
end

require 'rubocop/rake_task'
desc 'Run RuboCop on all directories'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.fail_on_error = true
end
