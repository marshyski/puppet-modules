# Install and run Jenkins CI Master
# Dependencies:  Java is needed to be installed prior to activating manifest

class jenkins(
  $jenkins_user   = 'jenkins',
  $jenkins_group  = 'jenkins',
  $jenkins_port   = '8080',
  $version        = 'installed',
  $key_url        = 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key',
  $repo_url       = 'http://pkg.jenkins-ci.org/redhat',
  $yum_repo       = '/etc/yum.repos.d/jenkins.repo',
  ) {

  group { $jenkins_group:
    ensure => present,
  }

  user { $jenkins_user:
    ensure   => present,
    comment  => 'Jenkins CI',
    home     => '/var/lib/jenkins',
    shell    => '/bin/nologin',
    password => '*',
    gid      => $jenkins_group,
    require  => Group[$jenkins_group],
  }

  $key_url  = 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key'
  $repo_url = 'http://pkg.jenkins-ci.org/redhat'
  $yum_repo = '/etc/yum.repos.d/jenkins.repo'

  yumrepo { 'jenkins':
    baseurl  => "$repo_url",
    descr    => 'Jenkins Yum Repo',
    enabled  => '1',
    gpgkey   => "$key_url",
    gpgcheck => '1',
    Require  => User[$jenkins_user],
  }

  package { 'java-1.7.0-openjdk':
    ensure   => latest,
    provider => yum,
  }

  package { 'jenkins':
    ensure   => $version,
    provider => yum,
    require  => [Yumrepo['jenkins'],Package['java-1.7.0-openjdk']],
  }

  file  { '/var/log/jenkins':
    ensure  => directory,
    owner   => $jenkins_user,
    group   => $jenkins_group,
    mode    => '0750',
    require => Pacakge['jenkins'],
  }

  file  { '/var/log/jenkins/jenkins.log':
    ensure  => present,
    owner   => $jenkins_user,
    group   => $jenkins_group,
    mode    => '0640',
    require => File['/var/log/jenkins'],
  }

  file { '/var/cache/jenkins':
    ensure  => directory,
    owner   => $jenkins_user,
    group   => $jenkins_group,
    mode    => '0750',
    require => Pacakge['jenkins'],
  }

  file { '/usr/lib/jenkins':
    ensure  => directory,
    owner   => $jenkins_user,
    group   => $jenkins_group,
    mode    => '0750',
    require => Pacakge['jenkins'],
  }

  file { '/usr/lib/jenkins/jenkins.war':
    owner   => $jenkins_user,
    group   => $jenkins_group,
    mode    => '0640',
    require => Pacakge['jenkins'],
  }

  file { '/var/lib/jenkins':
    ensure  => directory,
    owner   => $jenkins_user,
    group   => $jenkins_group,
    mode    => '0750',
    require => Pacakge['jenkins'],
  }

  file { '/var/lib/jenkins/tmp':
    ensure  => directory,
    owner   => $jenkins_user,
    group   => $jenkins_group,
    mode    => '0750',
    require => File['/var/lib/jenkins'],
  }

  if $::operatingsystem == 'CentOS' and $::operatingsystemrelease >= 6 {
    package { [ 'dejavu-sans-fonts', 'dejavu-sans-mono-fonts', 'dejavu-serif-fonts']:
      ensure => installed,
    }
  }

  if $::operatingsystem == 'RedHat' and $::operatingsystemrelease >= 6 {
    package { [ 'dejavu-sans-fonts', 'dejavu-sans-mono-fonts', 'dejavu-serif-fonts']:
      ensure => installed,
    }
  }

  file { '/etc/sysconfig/jenkins':
    owner   => root,
    group   => root,
    mode    => '0600',
    content => template('jenkins/jenkins.erb'),
    require => Package['jenkins'],
    notify  => Service['jenkins'],
  }

  service { 'jenkins':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => [Package['jenkins'],File['/etc/sysconfig/jenkins']];
  }
}
