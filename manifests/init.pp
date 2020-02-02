class puppetcron {
  file { '/etc/puppetlabs/code/environments/production/scripts/run-puppet.sh':
    ensure => link,
    target => '/usr/local/bin/run-puppet',
  }

  cron { 'run-puppet':
    command => '/usr/local/bin/run-puppet',
    hour    => '*',
    minute  => '*/15',
  }
}
