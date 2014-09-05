package 'advancecomp'
package 'gifsicle'
package 'jhead'
package 'jpegoptim'
package 'libjpeg-progs'
package 'optipng'
package 'pngcrush'

node.set.hostname_base = "#{node.application}-app"
node.set.deploy_roles = ['app']

node.set[:crowdtap][:deploy_branch] = 'ruby-2.1.2'

include_recipe 'crowdtap-ruby::unicorn'

template "/etc/nginx/sites-available/monocle" do
  source "etc/nginx/sites-available/monocle.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, 'service[nginx]'
end

nginx_site 'monocle'

service 'monocle' do
  action :start
  only_if { server_in_production? }
end
