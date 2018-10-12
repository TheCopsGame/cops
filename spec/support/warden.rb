# frozen_string_literal: true

RSpec.configure do |config|
  include Warden::Test::Helpers

  Warden.test_mode!

  config.after do
    Warden.test_reset!
  end
end
