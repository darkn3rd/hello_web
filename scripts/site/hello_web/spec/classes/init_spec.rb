require 'spec_helper'
describe 'hello_web' do
  context 'with default values for all parameters' do
    it { should contain_class('hello_web') }

    it 'should install package apache' do
      is_expected.to contain_package('apache2').with(ensure: 'present')
    end

    it { is_expected.to compile }
  end

end
