class compliance::auditd {

# Install audit package and dependencies
  package { 'audit':
    ensure => present,
  }

# Ensure audit.rules is present
  file { '/etc/audit/audit.rules':
    ensure  => present,
    owner   => root,
    group   => root,
    content => template('compliance/audit.rules'),
    require => Package['audit'],
  }

# Ensure auditd.conf is present
  file { '/etc/audit/auditd.conf':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0600',
    content => template('compliance/auditd.conf'),
    require => Package['audit'],
  }

# Ensure daemon is started and restarts when configuration has changed
  service { 'auditd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => [File['/etc/audit/audit.rules'], File['/etc/audit/auditd.conf']],
    require    => [File['/etc/audit/auditd.conf'], File['/etc/audit/audit.rules']],
  }
}
