#
# Cookbook Name:: app_user
# Recipe:: default
#
# Copyright 2014, Prix Fixe
#
# All rights reserved - Do Not Redistribute
#

firewall 'ufw' do
  action :enable
end

firewall_rule "http" do
  port 80
  action :allow
  notifies :enable, "firewall[ufw]"
end

user "app" do
  comment "prix fixe app user"
  home "/home/app"
  shell "/bin/bash"
end

directory "/home/app/" do
  owner "app"
  mode "0755"
  group "app"
  action :create
end

directory "/home/app/.ssh" do
  owner "app"
  mode "0700"
  group "app"
  action :create
end

cookbook_file "/home/app/.ssh/authorized_keys" do
  source "authorized_keys.app"
  owner "app"
  group "app"
  mode "0600"
end

directory "/srv/prixfixe-api" do
  owner "app"
  mode "0775"
end

directory "/var/log/prixfixe-api" do
  owner "app"
  mode "0775"
end

