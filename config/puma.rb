threads 8, 32

port 3000

environment ENV.fetch("RAILS_ENV") { "development" }

plugin :tmp_restart