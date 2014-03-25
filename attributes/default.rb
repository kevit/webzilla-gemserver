default[:gem_server][:ruby_version] = "1.9.3-p448"
default[:gem_server][:version]      = nil
default[:gem_server][:port]         = 9010
default[:gem_server][:host]         = node[:fqdn]
default[:gem_server][:home_path]    = "/opt/geminabox"
default[:gem_server][:data_path]    = "#{node[:gem_server][:home_path]}/data"
