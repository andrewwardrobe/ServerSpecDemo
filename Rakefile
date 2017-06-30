require 'bundler/gem_tasks'
require 'rake'
require 'rspec/core/rake_task'
require 'yaml'
require 'serverspec_launcher/rake_tasks'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec


task :spec    => 'spec:all'