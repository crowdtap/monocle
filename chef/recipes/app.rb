include_recipe 'crowdtap-ruby::unicorn'

template "/etc/nginx/sites-available/monocle" do
  source "etc/nginx/sites-available/monocle.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, 'service[nginx]'
end

nginx_site 'monocle'
