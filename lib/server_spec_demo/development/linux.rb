shared_examples 'development::linux' do
  describe package('linux-headers-generic') do
    it { is_expected.to be_installed }
  end
end