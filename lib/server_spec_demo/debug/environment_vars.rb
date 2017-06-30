shared_examples 'debug::environment_vars' do
  describe command('env') do
    its(:stdout){is_expected.to match /LEEK=SHEEK/}
    its(:stdout){is_expected.to match /MEEK=FREEK/}
  end

end