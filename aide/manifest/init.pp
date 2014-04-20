# Install aide, run aide, add aide check cron and ensure attributes set

class aide {

  # Install aide
  package { 'aide':
    ensure => installed;
  }

  # Execute aide checksum 
  exec { 'Aide Init':
    command => '/usr/sbin/aide --init',
    creates => '/var/lib/aide/aide.db.new.gz',
    user    => root,
    timeout => '-1',
    require => Package['aide'];

  exec { 'Install Aide Database':
    command => '/bin/cp -f /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz',
    creates => '/var/lib/aide/aide.db.gz',
    user    => root,
    require => [Package['aide'],Exec['Aide Init']];
  }

  # Add aide check crontab to root's
  cron { 'aide_cron':
    command => '/usr/sbin/aide --check',
    user    => root,
    hour    => '04',
    minute  => '05',
    require => Package['aide'];
  }

  # Ensure aide databases are set with correct permissions and ownership
  file {
  '/etc/aide.conf':
    ensure   => present,
    owner    => root,
    group    => root,
    mode     => '0600',
    source   => 'puppet:///modules/aide/aide.conf',
    require  => Package['aide'];
  '/var/lib/aide/aide.db.gz':
    owner   => root,
    group   => root,
    mode    => '0600',
    require => [Package['aide'],Exec['Aide Init'],Exec['Install Aide Database']];
  '/var/lib/aide/aide.db.new.gz':
    owner   => root,
    group   => root,
    mode    => '0600',
    require => [Package['aide'],Exec['Aide Init'],Exec['Install Aide Database']];
  }
}
