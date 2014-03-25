gem_package "geminabox" do
    action :install
end

directory "/opt/repos" do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end


git "/opt/repos/testgem" do
   repository "https://github.com/kevit/testgem.git"
   revision "HEAD"
   action :sync
   notifies :run, "bash[upload_gem]"
end

 bash "upload_gem" do
   cwd "/opt/repos/testgem"
   code <<-EOH
   gem build testgem.gemspec
   gem sources --add http://127.0.0.1:9010
   gem inabox -o -g http://127.0.0.1:9010 testgem-0.0.1.gem
   EOH
   environment 'PREFIX' => "/usr/local"
   action :nothing
 end
