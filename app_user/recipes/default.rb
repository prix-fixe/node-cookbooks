#
# Cookbook Name:: app_user
# Recipe:: default
#
# Copyright 2014, Prix Fixe
#
# All rights reserved - Do Not Redistribute
#

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

