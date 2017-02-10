#!/bin/bash

ruby /updateconfig.rb
exec /usr/bin/supervisord
