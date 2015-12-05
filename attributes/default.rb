# the following attribute should be set to the contents of a standard
# Formatron configuration data bag item
default['formatron_common']['configuration'] = nil

# override these as required
default['formatron_common']['filebeat']['paths'] = ['/var/log/**/*.log']
default['formatron_common']['sensu']['subscriptions'] = ['default']

# enable/disable beats (some are not very stable)
override['formatron_filebeat']['enabled'] = true
override['formatron_packetbeat']['enabled'] = false
override['formatron_topbeat']['enabled'] = false
