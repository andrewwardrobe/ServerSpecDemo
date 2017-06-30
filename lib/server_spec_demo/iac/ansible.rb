shared_examples 'iac::ansible' do
  describe package('ansible') do
    it { is_expected.to be_installed }
  end
end