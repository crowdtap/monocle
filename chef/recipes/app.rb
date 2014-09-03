package 'advancecomp'
package 'gifsicle'
package 'jhead'
package 'jpegoptim'
package 'libjpeg-progs'
package 'optipng'
package 'pngcrush'

node.set.hostname_base = "#{node.application}-app"
node.set.deploy_roles = ['app']

include_recipe 'crowdtap-ruby::unicorn'

template "/etc/nginx/sites-available/monocle" do
  source "etc/nginx/sites-available/monocle.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, 'service[nginx]'
end

nginx_site 'monocle'
