#
# Cookbook:: hello_web
# Spec:: default
#
# Copyright:: 2018, Joaquín Menchaca, All Rights Reserved.

require 'spec_helper'

describe 'hello_web::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:package) { 'apache2' }
    let(:service) { 'apache2' }
    let(:docroot) { '/var/www/html' }

    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'Should Updates the Apt Cache Daily' do
      expect(chef_run).to periodic_apt_update 'Update the apt cache daily'
    end

    include_examples 'default_hello_web'
  end

  context 'When overriding attirubtes on CentOS 7.5.1804' do
    let(:package) { 'httpd' }
    let(:service) { 'httpd' }
    let(:docroot) { '/var/www/html' }

    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'centos', version: '7.5.1804') do |node|
        node.normal['hello_web']['package'] = package
        node.normal['hello_web']['service'] = package
        node.normal['hello_web']['docroot'] = docroot
      end
      runner.converge(described_recipe)
    end

    include_examples 'default_hello_web'

  end
end
