source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bootsnap',           '>= 1.1.0', require: false
gem 'bootstrap-sass',     '~> 3.3.7'
gem 'cocoon',             '~> 1.2.11'
gem 'coffee-rails',       '~> 4.2'
gem 'enumerated_type',    '~> 0.5.0'
gem 'font-awesome-rails', '~> 4.7.0'
gem 'gretel',             '~> 3.0.9'
gem 'jquery-rails',       '~> 4.3.3'
gem 'lodash-rails',       '~> 4.17.5'
gem 'pg',                 '~> 1.0'
gem 'puma',               '~> 3.11'
gem 'rails',              '~> 5.2.0'
gem 'redis-namespace',    '~> 1.6.0'
gem 'sass-rails',         '~> 5.0'
gem 'simple_form',        '~> 4.0.0'
gem 'sprockets-es6',      '~> 0.9.2', require: 'sprockets/es6'
gem 'tzinfo-data',        '~> 1.2.5', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'uglifier',           '>= 1.3.0'

group :development, :test do
  gem 'byebug',             '~> 10.0', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails',  '~> 4.8.2'
  gem 'faker',              '~> 1.8.7'
  gem 'pry-rails',          '~> 0.3'
  gem 'rspec-rails',        '~> 3.7'
  gem 'rubocop',            '~> 0.55.0', require: false
  gem 'vcr',                '~> 4.0.0'
end

group :development do
  gem 'better_errors',          '~> 2.4.0'
  gem 'binding_of_caller',      '~> 0.8.0'
  gem 'bullet',                 '~> 5.7.5'
  gem 'listen',                 '>= 3.0.5', '< 3.2'
  gem 'spring',                 '~> 2.0.2'
  gem 'spring-watcher-listen',  '~> 2.0.0'
  gem 'web-console',            '>= 3.3.0'
end

group :test do
  gem 'capybara',                 '>= 2.15', '< 4.0'
  gem 'database_cleaner',         '>= 1.6.2'
  gem 'rails-controller-testing', '~> 1.0.2'
  gem 'selenium-webdriver',       '~> 3.11'
  gem 'shoulda-matchers',         '~> 3.1'
  gem 'simplecov',                '~> 0.16.1', require: false
  gem 'webmock',                  '~> 3.3.0'
end
