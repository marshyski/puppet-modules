class compliance::auditd {

# Install audit package
  package { 'audit':
    ensure => present,
    }

# Ensure audit.rules is current
  file { '/etc/audit/audit.rules':
    ensure  => present,
    owner   => root,
    group   => root,
    content => template('compliance/audit.rules'),
    require => Package['audit'],
    }

# Ensure auditd.conf is current
  file { '/etc/audit/auditd.conf':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 600,
    content => template('compliance/auditd.conf'),
    require => Package['audit'],
    }

# Ensure daemon restarts when configuration change has been made
  service { 'auditd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => [Package['audit'], File['/etc/audit/audit.rules'], File['/etc/audit/auditd.conf']],
    require    => [File['/etc/audit/auditd.conf'], File['/etc/audit/audit.rules']];
    }
}
