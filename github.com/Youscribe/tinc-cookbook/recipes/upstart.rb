#
# Cookbook Name:: tinc
# Recipe:: upstart
#
# Author:: Guilhem Lettron <guilhem.lettron@youscribe.com>
#
# Copyright 20012, Societe Publica.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if node[:platform_version].to_f >= 9.10
	cookbook_file "/etc/init/tinc.conf" do
		source "upstart-tinc.conf"
		owner "root"
		group "root"
		mode "0644"
	end

	cookbook_file "/etc/init/tinc-all.conf" do
		source "upstart-tinc-all.conf"
		owner "root"
		group "root"
		mode "0644"
	end

	service "tinc-all" do
		provider Chef::Provider::Service::Upstart
	end
end
