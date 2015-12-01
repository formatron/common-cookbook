configuration = node['formatron_common']['configuration']
hosted_zone_name = configuration['dsl']['global']['hosted_zone_name']

elk_config = configuration['config']['elk']
node.override['formatron_filebeat']['logstash']['hostname'] = "#{elk_config['sub_domain']}.#{hosted_zone_name}"
node.override['formatron_filebeat']['logstash']['port'] = elk_config['logstash_port']
node.override['formatron_filebeat']['paths'] = ['/var/log/**/*.log']
include_recipe 'formatron_filebeat::default'
