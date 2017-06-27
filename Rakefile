require 'bundler/gem_tasks'
require 'rake'
require 'rspec/core/rake_task'
require 'yaml'
RSpec::Core::RakeTask.new(:spec)

task :default => :spec


task :spec    => 'spec:all'
task :serverspec  => 'serverspec:all'

properties = YAML.load_file('properties.yml')


namespace :serverspec do
  task :all => properties[:targets].keys.map {|key| 'serverspec:' + key.split('.')[0] }
  properties[:targets].keys.each do |key|
    spec_type = properties[:targets][key][:spec_type] || 'default'
    desc "Run serverspec to #{key}"
    if properties[:targets][key][:hosts].is_a?(Array)
        task key.to_sym => "serverspec:#{key}:all"
        namespace key.to_sym do
          task :all => properties[:targets][key][:hosts].map {|host| "serverspec:#{key}:#{host.split('.')[0].to_sym}" }
          properties[:targets][key][:hosts].each do |host|
            RSpec::Core::RakeTask.new(host.split('.')[0].to_sym) do |t|
              ENV['TARGET_HOST'] = host
              ENV['TARGET'] = key
              ENV['TASK_NAME'] = "#{key}:#{host || properties[:targets][key][:name]}"
              t.pattern = "spec/#{spec_type}_spec.rb"
            end
          end
        end
    elsif properties[:targets][key][:hosts]
      RSpec::Core::RakeTask.new(key.split('.')[0].to_sym) do |t|
        ENV['TARGET_HOST'] = properties[:targets][key][:hosts]
        ENV['TARGET'] = key
        ENV['TASK_NAME'] = "#{key||properties[:targets][key][:name]}"
        t.pattern = "spec/#{spec_type}_spec.rb"
      end
    else

      RSpec::Core::RakeTask.new(key.split('.')[0].to_sym) do |t|
        ENV['TARGET_HOST'] = key
        ENV['TARGET'] = key
        ENV['TASK_NAME'] = "#{key||properties[:targets][key][:name]}"
        t.pattern = "spec/#{spec_type}_spec.rb"
      end
    end
  end
end