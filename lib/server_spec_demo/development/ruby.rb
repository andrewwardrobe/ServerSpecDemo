shared_examples 'development::ruby' do
  describe package('ruby') do
    it { is_expected.to be_installed }
  end
  describe package('ruby-dev') do
    it { is_expected.to be_installed }
  end
  describe package('bundle') do
    it { is_expected.to be_installed.by('gem') }
  end
  describe package('serverspec') do
    it { is_expected.to be_installed.by('gem') }
  end
  describe package('rails') do
    it { is_expected.to be_installed.by('gem') }
  end
end