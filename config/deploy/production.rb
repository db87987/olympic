set :stage, :production
set :rails_env, :production
set :branch, 'master'
server '78.47.135.87', user: 'deploy', roles: %w{app db web}
