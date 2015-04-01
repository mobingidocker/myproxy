#!/usr/bin/env ruby

config = <<-ENDOFCONFIG
[mysql-proxy]

daemon = false

admin-address = #{ENV["ADMIN_ADDRESS"]}
admin-username = #{ENV["ADMIN_USERNAME"]}
admin-password = #{ENV["ADMIN_PASSWORD"]}
admin-lua-script = /usr/share/mysql-proxy/admin.lua

proxy-address = #{ENV["PROXY_ADDRESS"]}
proxy-backend-addresses = #{ENV["MASTER_ADDRESSES"]}
proxy-read-only-backend-addresses = #{ENV["SLAVE_ADDRESSES"]}
proxy-lua-script = /usr/share/mysql-proxy/rw-splitting.lua

log-file = /var/log/mysql-proxy.log
log-level = debug
ENDOFCONFIG

File.open("/etc/mysql-proxy.conf", 'w') do |file| 
	file.write(config)
end
