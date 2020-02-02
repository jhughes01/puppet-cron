# puppet cron deploys a cronjob to automate puppet runs
class puppetcron {
  file { '/usr/local/bin/run-puppet':
    ensure => link,
    target => '/etc/puppetlabs/code/environments/production/scripts/run-puppet.sh',
  }

  cron { 'run-puppet':
    command => '/usr/local/bin/run-puppet &>> /var/log/puppet-cron.log',
    hour    => '*',
    minute  => '*/15',
  }
}
