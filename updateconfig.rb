#!/usr/bin/env ruby

config = <<-ENDOFCONFIG
[mysql-proxy]

admin-address = #{ENV["ADMIN_ADDRESS"]}

proxy-address = #{ENV["PROXY_ADDRESS"]}
proxy-backend-addresses = #{ENV["MASTER_ADDRESSES"]}
proxy-read-only-backend-addresses = #{ENV["SLAVE_ADDRESSES"]}
proxy-lua-script = $ROOT_DIR/mysql-proxy/share/doc/mysql-proxy/rw-splitting.lua

log-file = /var/log/mysql-proxy.log
log-level = debug
ENDOFCONFIG

File.open("/etc/mysql-proxy.conf", 'w') do |file| 
	file.write(config)
end
