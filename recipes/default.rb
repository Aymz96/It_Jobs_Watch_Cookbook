#
# Cookbook:: It_Jobs_Watch_Cookbook
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.


apt_update 'update_sources' do
  action :update
end

package 'python3-pip'
package 'packer'

remote_directory "/home/ubuntu/app" do
  user 'root'
  group 'root'
  source 'requirements'
  action :create
end

bash 'install chef' do  code <<-EOL
  wget https://packages.chef.io/files/stable/chef-workstation/0.2.43/ubuntu/18.04/chef-workstation_0.2.43-1_amd64.deb
  sudo dpkg -i chef-workstation_*.deb
  rm chef-workstation_*.deb
  EOL
end

bash 'install_java' do
  code <<-EOH
    sudo apt-get -y install default-jdk default-jre
    EOH
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
