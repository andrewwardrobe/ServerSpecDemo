require 'serverspec'

shared_examples 'containers::geminabox' do
  describe file('/webapps/geminabox/config/config.ru') do
    it { is_expected.to be_a_file }
    it { is_expected.to exist }
  end

  describe process('/usr/local/bin/ruby') do
    its(:args) { is_expected.to match /\/usr\/local\/bundle\/bin\/rackup --host 0.0.0.0/}
  end


end