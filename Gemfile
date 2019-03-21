source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem "rails", "~> 5.1.2"
gem "sqlite3", "~> 1.3.6"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bootstrap-sass", ">= 3.4.1"
gem "font-awesome-rails"
gem "config"
gem "devise"
gem "will_paginate", "3.1.0"
gem "carrierwave", "~> 1.0"
gem "mini_magick", "3.8.0"
gem "omniauth-facebook"
gem "figaro"
gem "pry"
gem "jquery-rails"
gem "faker"
gem "ransack"
gem "private_pub"
gem "thin"
gem "rails_admin", git: "git://github.com/sferik/rails_admin.git"
gem "will_paginate-bootstrap"
gem "nokogiri", ">= 1.8.5"
gem "activejob", ">= 5.1.6.1"
gem "rack", ">= 2.0.6"
gem "rails-html-sanitizer", ">= 1.0.4"
gem "loofah", ">= 2.2.3"
gem "actionview", ">= 5.1.6.2"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
