# # encoding: utf-8

# Inspec test for recipe hello_web::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

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
