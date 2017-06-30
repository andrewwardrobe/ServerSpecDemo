shared_examples 'development::puppet' do
  describe package('puppet-lint') do
    it { is_expected.to be_installed }
  end
end