#
# Cookbook:: It_Jobs_Watch_Cookbook
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.


apt_update 'update_sources' do
  action :update
end

package 'python3-pip'


remote_directory "/home/ubuntu/app" do
  user 'root'
  group 'root'
  source 'requirements'
  action :create
end

bash "install_requirement" do
  user 'root'
  group 'root'
  code <<-EOH
    sudo pip3 install -r /home/ubuntu/app/requirements.txt
    EOH
end

# directory "/home/vagrant/Downloads" do
#   owner 'root'
#   group 'root'
#   mode '0777'
#   action :create
# end

directory "/home/ubuntu/Downloads" do
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end
