hostsfile_entry '127.0.0.1' do
  hostname 'sensu.mydomain.com'
  action :append
end

node.default['formatron_common']['configuration'] = {
  'dsl' => {
    'global' => {
      'hosted_zone_name' => 'mydomain.com'
    }
  },
  'config' => {
    'logstash' => {
      'sub_domain' => 'logstash',
      'port' => '5044'
    },
    'ntp_server' => {
      'sub_domain' => 'ntp'
    },
    'sensu' => {
      'sub_domain' => 'sensu',
      'checks' => {
        'mycheck' => {
          'gem' => 'cpu',
          'attributes' => {
            'command' => 'check-cpu.rb',
            'standalone' => true,
            'subscribers' => ['default'],
            'interval' => 10,
            'handlers' => ['relay']
          }
        }
      },
      'gems' => {
        'cpu' => {
          'gem' => 'sensu-plugins-cpu-checks',
          'version' => '0.0.4'
        }
      }
    },
    'secrets' => {
      'sensu' => {
        'rabbitmq' => {
          'vhost' => '/sensu',
          'user' => 'sensu',
          'password' => 'password'
        }
      }
    }
  }
}

node.default['formatron_sensu']['client']['subscriptions'] = ['default']

include_recipe 'formatron_common::default'
