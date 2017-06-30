shared_examples 'development::docker' do
  describe package('docker.io'), :if => os[:family] == 'raspbian' do
    it { is_expected.to be_installed }
  end
  describe package('docker-ce'), :if => os[:family] == 'ubuntu' do
    it { is_expected.to be_installed }
  end
end