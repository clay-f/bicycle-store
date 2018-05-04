source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails'
gem 'puma'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'bcrypt'
gem 'activeadmin'
gem 'cancan'
gem 'carrierwave'
gem 'jquery-rails'
gem 'sprockets-rails'
gem "mini_magick"
gem 'sidekiq'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'poltergeist'
  gem 'pry-byebug'
  gem 'minitest'
  gem 'factory_bot_rails'
end

group :development do
  gem 'sqlite3'
  gem 'faker'
  gem 'capistrano-rails'
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
