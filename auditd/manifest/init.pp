# Install audit, service start, chkconfig on and manage rules

class auditd {

  # Install auditd
  package { 'audit':
    ensure => latest,
  }

  # Start auditd daemon and chkconfig on
  service { 'auditd':
    ensure    => running,
    enable    => true,
    hasstatus => true,
    require   => Package['audit'],
  }

  # Set audit rules configuration
  file { '/etc/audit/audit.rules':
    ensure   => present,
    owner    => root,
    group    => root,
    mode     => '0600',
    content  => template('auditd/audit.rules.erb'),
    require  => Package['audit'],
  }

  # Set auditd daemon configuration
  file { '/etc/audit/auditd.conf':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0600',
    content => template('auditd/auditd.conf.erb'),
    require => Package['audit'],
  }

  # Remove temporary installed files
  file {
    [
      '/etc/audit/audit.rules.rpmnew',
      '/etc/audit/audit.conf.rpmnew',
    ]:
      ensure  => absent,
      require => Package['audit'],
  }

}
