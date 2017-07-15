require 'spec_helper'

context "In Order to run this demo" do

  describe file('/home/andrew/.ssh/jenkins.rsa') do
    it { should exist }
  end

  describe package('docker-ce'), :if => os[:family] == 'ubuntu' do
    it { is_expected.to be_installed }
  end

  describe package('docker-compose') do
    it { is_expected.to be_installed }
  end
  describe package('ruby') do
    it { is_expected.to be_installed }
  end
  describe package('ruby-dev') do
    it { is_expected.to be_installed }
  end
  describe package('bundle') do
    it { is_expected.to be_installed.by('gem') }
  end
  describe package('serverspec') do
    it { is_expected.to be_installed.by('gem') }
  end
  describe package('docker-ce'), :if => os[:family] == 'ubuntu' do
    it { is_expected.to be_installed }
  end

  describe package('docker-compose') do
    it { is_expected.to be_installed }
  end
  describe docker_image('andrewwardrobe/ssjenkins') do
    it { is_expected.to exist }
  end
  describe docker_container('serverspecdemo_jenkins_1') do
    it { is_expected.to exist }
    it { is_expected.to be_running }
  end
end