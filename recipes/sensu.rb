configuration = node['formatron_common']['configuration']
hosted_zone_name = configuration['dsl']['global']['hosted_zone_name']

sensu_config = configuration['config']['sensu']
sensu_secrets = configuration['config']['secrets']['sensu']
sensu_hostname = "#{sensu_config['sub_domain']}.#{hosted_zone_name}"
sensu_checks = sensu_config['checks']
sensu_gems = sensu_config['gems']
rabbitmq_vhost = sensu_secrets['rabbitmq']['vhost']
rabbitmq_user = sensu_secrets['rabbitmq']['user']
rabbitmq_password = sensu_secrets['rabbitmq']['password']
node.default['formatron_sensu']['rabbitmq']['host'] = sensu_hostname
node.default['formatron_sensu']['rabbitmq']['vhost'] = rabbitmq_vhost
node.default['formatron_sensu']['rabbitmq']['user'] = rabbitmq_user
node.default['formatron_sensu']['rabbitmq']['password'] = rabbitmq_password
node.default['formatron_sensu']['checks'] = sensu_checks unless sensu_checks.nil?
node.default['formatron_sensu']['gems'] = sensu_gems unless sensu_gems.nil?

include_recipe 'formatron_sensu::default'
include_recipe 'formatron_sensu::client'
