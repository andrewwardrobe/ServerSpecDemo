require 'serverspec'

shared_examples 'containers::geminabox' do
  describe file('/webapps/geminabox/config/config.ru') do
    it { is_expected.to be_a_file }
    it { is_expected.to exist }
  end



end