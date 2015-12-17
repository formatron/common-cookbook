configuration = node['formatron_common']['configuration']
hosted_zone_name = configuration['dsl']['global']['hosted_zone_name']

ntp_server_config = configuration['config']['ntp_server']
node.default['formatron_ntp']['servers'] = [
  "#{ntp_server_config['sub_domain']}.#{hosted_zone_name}"
]
include_recipe 'formatron_ntp::default'
