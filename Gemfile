source "https://rubygems.org"

ruby "> 2.6"

group :test do
  gem "rspec"

  source "https://gem.mutant.dev" do
    gem "mutant-license"
  end

  gem "mutant-rspec"
end

group :development do
  gem "standard"
  gem "rubycritic", require: false
end
