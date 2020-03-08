# puppet cron deploys a cronjob to automate puppet runs
class puppetcron {
  file { '/usr/local/bin/run-puppet':
    ensure => present,
    source => 'puppet:///modules/puppetcron/run-puppet.sh',
  }

  package { 'moreutils':
    ensure => 'present'
  }

  cron { 'run-puppet':
    command => '/bin/bash /usr/local/bin/run-puppet | ts &>> /var/log/puppet-cron.log',
    hour    => '*',
    minute  => '*/10',
  }
}
