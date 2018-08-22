#
# Cookbook:: hello_web
# Spec:: default
#
# Copyright:: 2018, Joaquín Menchaca, All Rights Reserved.

require 'spec_helper'

describe 'hello_web::default' do
  #platform 'ubuntu'

  context 'When all attributes are default, on Ubuntu' do
    let(:package) { 'apache2' }
    let(:service) { 'apache2' }
    let(:docroot) { '/var/www/html' }

    # let(:chef_run) do
    #   runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
    #   runner.converge(described_recipe)
    # end

    it 'converges successfully' do
      is_expected.to_not raise_error
    end

    it 'Should Updates the Apt Cache Daily' do
      is_expected.to periodic_apt_update 'Update the apt cache daily'
    end

    it 'Should Installs Apache Web Server Package' do
      is_expected.to install_package package
    end

    it 'Should enables Apache Web Server service' do
      is_expected.to enable_service service
    end

    it 'Should starts Apache Web Server service' do
      is_expected.to start_service service
    end

    it 'Should copy HTML content to docroot' do
      is_expected.to create_cookbook_file "#{docroot}/index.html"
    end
  end

  # context 'When overriding attirubtes on 7.5.1804' do
  #   let(:package) { 'httpd' }
  #   let(:service) { 'httpd' }
  #   let(:docroot) { '/var/www/html' }
  #
  #   let(:chef_run) do
  #     runner = ChefSpec::SoloRunner.new(platform: 'centos', version: '7.5.1804') do |node|
  #       node.normal['hello_web']['package'] = package
  #       node.normal['hello_web']['service'] = package
  #       node.normal['hello_web']['docroot'] = docroot
  #     end
  #     runner.converge(described_recipe)
  #   end
  #
  #   it 'converges successfully' do
  #     expect { chef_run }.to_not raise_error
  #   end
  #
  #   it 'Should Installs Apache Web Server Package' do
  #     expect(chef_run).to install_package package
  #   end
  #
  #   it 'Should enables Apache Web Server service' do
  #     expect(chef_run).to enable_service service
  #   end
  #
  #   it 'Should starts Apache Web Server service' do
  #     expect(chef_run).to start_service service
  #   end
  #
  #   it 'Should copy HTML content to docroot' do
  #     expect(chef_run).to create_cookbook_file "#{docroot}/index.html"
  #   end
  # end
end
