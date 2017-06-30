shared_examples 'editors::vim' do
  describe package('vim') do
    it { is_expected.to be_installed }
  end
end