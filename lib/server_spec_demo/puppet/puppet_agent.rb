shared_examples 'puppet::agent' do
  describe package('puppet') do
    it { is_expected.to be_installed }
  end
end