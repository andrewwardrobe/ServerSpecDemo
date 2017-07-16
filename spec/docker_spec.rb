require 'spec_helper'

describe package('apache2') do
  it { is_expected.to be_installed }
end

describe package('php5') do
  it { is_expected.to be_installed }
end


describe package('libapache2-mod-php5') do
  it { is_expected.to be_installed }
end

describe port('80') do
  it { is_expected.to be_listening }
end

describe service('apache2') do
  it { is_expected.to be_enabled }
end

describe Serverspec::Type::File.new('/usr/local/apache2/htdocs/index.html') do
  it { is_expected.to be_a_file }
  it { should exist }
end