shared_examples 'development::javascript' do
  describe package('nodejs') do
    it { is_expected.to be_installed }
  end
  describe package('npm') do
    it { is_expected.to be_installed }
  end
end