shared_examples 'development::docker-compose' do
  describe package('docker-compose') do
    it { is_expected.to be_installed }
  end
end