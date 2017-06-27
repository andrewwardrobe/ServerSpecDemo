$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "server_spec_demo"
require 'serverspec'
require 'rspec'

require 'net/ssh'
require 'tempfile'
require 'yaml'
require 'rubygems'
require 'docker'
require 'bundler'


#Load in shared examples for any dependancy gems

Bundler.load.specs.map{|s| s.name}.each do |dep|
  Gem.find_files("#{dep}/**/*.rb").each do |path|
    require path if File.open(path).grep(/shared_examples/).any?
  end
end

host = ENV['TARGET_HOST']
target = ENV['TARGET']


properties = YAML.load_file('properties.yml')
target_properties = properties[:targets][target]
backend = target_properties[:backend] || 'ssh'
target_properties[:target] =  ENV['TASK_NAME']



set_property target_properties


if backend == 'exec'
  set :backend, :exec
elsif backend == 'docker'
  set :backend, :docker

  if target_properties[:docker_build_dir]
    image = Docker::Image.build_from_dir(target_properties[:docker_build_dir])
    set :docker_image, image.id
  end
  set :docker_image, target_properties[:docker_image] if target_properties[:docker_image]
  set :docker_container, target_properties[:docker_container] if target_properties[:docker_container]
  set :docker_url, target_properties[:docker_url] if target_properties[:docker_url]
  set :docker_container_create_options, target_properties[:docker_options] if target_properties[:docker_options]

else
  set :backend, :ssh

  if ENV['ASK_SUDO_PASSWORD']
    begin
      require 'highline/import'
    rescue LoadError
      fail "highline is not available. Try installing it."
    end
    set :sudo_password, ask("Enter sudo password: ") { |q| q.echo = false }
  else
    set :sudo_password, ENV['SUDO_PASSWORD']
  end

  ssh_user = target_properties[:user] || Etc.getlogin

  options = Net::SSH::Config.for(host)
  if backend == 'vagrant'

    host = target_properties[:vagrant_host] || 'default'
    vagrant_dir = target_properties[:vagrant_host]

    Dir.chdir(vagrant_dir) if vagrant_dir
    `vagrant up #{host}`

    config = Tempfile.new('', Dir.tmpdir)
    config.write(`vagrant ssh-config #{host}`)
    config.close
    options = Net::SSH::Config.for(host, [config.path])

  end



  options[:user] ||= ssh_user

  set :host,        options[:host_name] || host
  set :ssh_options, options

  # Disable sudo
  # set :disable_sudo, true


  # Set environment variables
  if target_properties[:environment]
    env =  target_properties[:environment].map do |env|
      variable, value = env.split('=')
      {variable.to_sym => value}
    end.reduce({},:merge)
    set :env, env
    set :env, 'LEEK' => 'SHEEK'
    puts env
  end


  # Set PATH
  # set :path, '/sbin:/usr/local/sbin:$PATH'
end

