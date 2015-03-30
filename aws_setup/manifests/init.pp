class aws_config {

  package { 'awscli':
    ensure   => latest,
    provider => pip,
  }

  file { '/root/.aws':
    ensure  => directory,
    owner   => root,
    group   => root,
    require => Package['awscli'},
  }

  file { '/root/.aws/config':
    ensure  => present,
    owner   => root,
    group   => root,
    content => template('aws_config/config.erb')
    require => File['/root/.aws'],
  }

  file { '/etc/environment':
    ensure  => present,
    content => template('aws_config/environment.erb')
  }

}
