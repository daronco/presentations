# coding: utf-8

require 'yaml'
require 'pp'

configs = YAML.load_file("/demo/config.yml")
pp configs

# puts "----"
# puts ENV['MYAPP_LALA']
# puts ENV['MYAPP_OUTRO']
# puts "----"
