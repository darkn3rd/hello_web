# # encoding: utf-8

# Inspec test for recipe hello_web::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

PACKAGE = attribute('package', default: 'apache2', description: 'package name')
SERVICE = attribute('service', default: 'apache2', description: 'service name')

######## USELESS TESTS - DONT DO THIS ########
describe package(PACKAGE) do
  it { should be_installed }
end

describe service(SERVICE) do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

######## CONTRACT TESTS ########
describe port(80) do
  it { should be_listening }
end

describe http('localhost') do
  its('status') { should eq 200 }
  its('headers.Content-Type') { should include 'text/html' }
  its('body') { should include 'Hello World!' }
end
