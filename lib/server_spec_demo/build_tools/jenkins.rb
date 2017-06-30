shared_examples 'build_tools::jenkins' do
  describe user('jenkins') do
    it { is_expected.to exist }
  end

end
