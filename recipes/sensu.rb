configuration = node['formatron_common']['configuration']
hosted_zone_name = configuration['dsl']['global']['hosted_zone_name']

sensu_config = configuration['config']['sensu']
sensu_hostname = "#{sensu_config['sub_domain']}.#{hosted_zone_name}"
sensu_checks = sensu_config['checks']
sensu_gems = sensu_config['gems']
rabbitmq_vhost = sensu_config['rabbitmq']['vhost']
rabbitmq_user = sensu_config['rabbitmq']['user']
rabbitmq_password = sensu_config['rabbitmq']['password']
node.override['formatron_sensu']['rabbitmq']['host'] = sensu_hostname
node.override['formatron_sensu']['rabbitmq']['vhost'] = rabbitmq_vhost
node.override['formatron_sensu']['rabbitmq']['user'] = rabbitmq_user
node.override['formatron_sensu']['rabbitmq']['password'] = rabbitmq_password
node.override['formatron_sensu']['checks'] = sensu_checks unless sensu_checks.nil?
node.override['formatron_sensu']['gems'] = sensu_gems unless sensu_gems.nil?

include_recipe 'formatron_sensu::default'
include_recipe 'formatron_sensu::client'
