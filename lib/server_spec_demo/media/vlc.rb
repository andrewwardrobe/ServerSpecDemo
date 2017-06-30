shared_examples 'media::vlc' do
  describe package('vlc') do
    it { is_expected.to be_installed }
  end
end