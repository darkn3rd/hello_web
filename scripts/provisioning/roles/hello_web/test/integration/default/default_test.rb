# # encoding: utf-8

# Inspec test for recipe hello_web::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

PACKAGE = attribute('package', default: 'apache2', description: 'package name')
SERVICE = attribute('service', default: 'apache2', description: 'service name')

######## ILLUSTRATIVE PURPOSES ONLY ########
# NOTE: These tests are put here for teaching purposes, to illustrate basic
#  functionality of InSpec. These tests have low or negative value, as they
#  they don't test the promise of the service, but implementation, which varies
#  greatly from operating system to operating system.
describe package(PACKAGE) do
  it { should be_installed }
end

describe service(SERVICE) do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

######## CONTRACT TESTS ########
# NOTE: These tests test the promise or contract of the service, which is that
# that there is a listening web server with 'Hellow World!' content.
describe port(80) do
  it { should be_listening }
end

describe http('localhost') do
  its('status') { should eq 200 }
  its('headers.Content-Type') { should include 'text/html' }
  its('body') { should include 'Hello World!' }
end
