source 'https://rubygems.org/'

gem 'rails', '~> 5.1.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'

gem "devise", git: 'https://github.com/plataformatec/devise.git'
gem 'haml-rails'
gem 'bootstrap', '~> 4.0.0.alpha6'

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end

group :development, :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'launchy', require: false
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda'
  gem 'valid_attribute'
  gem 'selenium-webdriver'
  gem 'listen'
end

group :test do
  gem 'coveralls', require: false
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem 'orderly'
end

#TODO look this up more thoroughly; Launch recommends it in their setup but I'm not sure what I need it for yet. Timezone something.
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
