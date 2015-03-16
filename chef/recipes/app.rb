package 'advancecomp'
package 'gifsicle'
package 'jhead'
package 'jpegoptim'
package 'libjpeg-progs'
package 'optipng'
package 'pngquant'

crowdtap_ruby_application "monocle" do
  ruby_version '2.1'
  unicorns
  nginx do
    template 'etc/nginx/sites-available/monocle.erb'
  end
end
