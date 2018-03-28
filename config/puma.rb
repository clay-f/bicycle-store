workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 1)
threads threads_count, 16

preload_app!

rackup DefaultRackup
port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'

before_fork do
  puts "puma master process about to fork. closoing existing activerecord connections."
  ActiveRecord::Base.connection.disconnect!
end

on_worker_boot do
  ActiveRecord::Base.establish_connection
end
