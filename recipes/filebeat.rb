configuration = node['formatron_common']['configuration']
hosted_zone_name = configuration['dsl']['global']['hosted_zone_name']

logstash_config = configuration['config']['logstash']
node.default['formatron_filebeat']['logstash']['host'] = "#{logstash_config['sub_domain']}.#{hosted_zone_name}"
node.default['formatron_filebeat']['logstash']['port'] = logstash_config['beats_port']
include_recipe 'formatron_filebeat::default'

formatron_filebeat_prospector 'syslog' do
  paths [
    '/var/log/syslog'
  ]
end
