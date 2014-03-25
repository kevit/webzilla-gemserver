gem_package "geminabox" do
    action :install
end

directory "/opt/repos" do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end


gems = data_bag('gems')

gems.each do |gem_info|
  current_gem = data_bag_item('gems', gem_info)
  gem_name = current_gem['id']
  gem_version = current_gem['version']
  git "/opt/repos/#{gem_name}" do
     repository current_gem['repository_url']
     revision current_gem['revision']
     action :sync
     notifies :run, "bash[upload_gem]"
  end

  bash "upload_gem" do
   cwd "/opt/repos/#{gem_name}"
   code <<-EOH
   gem build #{gem_name}.gemspec
   gem sources --add http://127.0.0.1:9010
   gem inabox -o -g http://127.0.0.1:9010 testgem-#{gem_version}.gem
   EOH
   environment 'PREFIX' => "/usr/local"
   action :nothing
  end

end


