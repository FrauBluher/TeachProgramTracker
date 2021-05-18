source 'https://rubygems.org'

ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'rb-readline'
gem 'pg', '~> 0.18'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'devise_invitable'

gem 'haml-rails'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'sendgrid-ruby'
gem 'filterrific'
gem 'will_paginate_semantic_ui'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  gem 'launchy'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :test do
  gem 'capybara-selenium'
  gem 'rails-controller-testing'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'rails_12factor', group: :production

gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'
