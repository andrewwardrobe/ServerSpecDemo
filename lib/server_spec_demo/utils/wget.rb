shared_examples 'utils::wget' do
  describe package('wget') do
    it { is_expected.to be_installed }
  end
end