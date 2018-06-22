ENV['RAILS_ENV'] ||= 'test'

if ENV['coverage'] == 'on'
  require 'simplecov'
  require 'codecov'
  SimpleCov.start('rails') do
    add_filter 'enumerators'
    add_filter 'spec'
    add_filter 'initializers'
    add_filter 'app/channels'
    add_filter 'app/views'
    add_filter 'app/jobs/application_job.rb'
    add_filter 'app/mailers/application_mailer.rb'
    add_filter 'app/models/application_record.rb'
    minimum_coverage 100
  end
  SimpleCov.formatter = SimpleCov::Formatter::Codecov if ENV['ci'] == 'true'
end

require File.expand_path('../../config/environment', __FILE__)

# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'
require 'spec_helper'

# Require support files
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
