# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)



set :app_file, __FILE__

configure do
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || "secret"
end

run Sinatra::Application
