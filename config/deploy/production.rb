server '3.115.187.185', user: 'app', roles: %w{app db web}

set :ssh_options, {
  port: 22,
  forward_agent: true,
  keys: ['/Users/yamashitaryoutarou/.ssh/id_rsa']
}