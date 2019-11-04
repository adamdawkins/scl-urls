require 'rspec/expectations'

RSpec::Matchers.define :have_path do |expected|
  match do |actual|
    URI.parse(actual.get_header('location')).path == expected
  end
end
