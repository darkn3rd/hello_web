# frozen_string_literal: true
require 'chefspec'
require 'chefspec/berkshelf'

at_exit { ChefSpec::Coverage.report! }

shared_examples 'default_hello_web' do
  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end

  ######## ILLUSTRATIVE PURPOSES ONLY ########
  # NOTE: These tests are put here for teaching purposes, to illustrate basic
  # functionality of ChefSpec. These tests have low value, as they just test
  # the Chef API, not your code.

  it 'Should Installs Apache Web Server Package' do
    expect(chef_run).to install_package package
  end

  it 'Should enables Apache Web Server service' do
    expect(chef_run).to enable_service service
  end

  it 'Should start Apache Web Server service' do
    expect(chef_run).to start_service service
  end

  it 'Should copy HTML content to docroot' do
    expect(chef_run).to create_cookbook_file "#{docroot}/index.html"
  end
end
