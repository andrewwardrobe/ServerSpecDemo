shared_examples 'database::mongo' do
  describe package('mongodb-org') do
    it { is_expected.to be_installed }
  end
end