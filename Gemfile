source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'active_model_serializers'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'factory_bot_rails', '~> 5.0', '>= 5.0.2'
gem 'faker', '~> 2.2', '>= 2.2.1'
gem 'jbuilder', '~> 2.5'
gem 'jwt'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'simplecov', require: false, group: :test
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
