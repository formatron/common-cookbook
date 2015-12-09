include_recipe 'chef-client::default'
include_recipe 'formatron_common::dependencies'
include_recipe 'formatron_common::filebeat'
include_recipe 'formatron_common::sensu'
