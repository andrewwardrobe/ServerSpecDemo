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

require 'serverspec_launcher/spec_helper'

