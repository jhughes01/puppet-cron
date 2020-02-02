class puppetcron {
  file { '/usr/local/bin/run-puppet':
    ensure => link,
    target => '/etc/puppetlabs/code/environments/production/scripts/run-puppet.sh',
  }

  cron { 'run-puppet':
    command => '/usr/local/bin/run-puppet',
    hour    => '*',
    minute  => '*/15',
  }
}
