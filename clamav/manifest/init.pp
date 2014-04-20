# Install ClamAV from rpmforge and update anti-virus defitions

class clamav(
  $clamav_user    = 'clamav',
  $clamav_group   = 'clamav',
  $clamav_version = 'latest',) {

  include rpmforge

  package { 'clamav':
    ensure   => $clamav_version,
    provider => yum,
    require  => Yumrepo['rpmforge'],
  }

  file { '/etc/cron.daily/freshclam':
    ensure  => absent,
    require => Package['clamav'],
  }

  file { '/var/clamav/main.cvd':
    ensure  => present,
    backup  => true,
    replace => yes,
    owner   => $clamav_user,
    group   => $clamav_group,
    mode    => '0644',
    source  => 'puppet:///modules/clamav/main.cvd',
    require => Package['clamav'],
  }

  file { '/var/clamav/daily.cvd':
    ensure  => present,
    backup  => false,
    replace => true,
    owner   => $clamav_user,
    group   => $clamav_group,
    mode    => '0644',
    source  => 'puppet:///modules/clamav/daily.cvd',
    require => Package['clamav'],
  }

  file  { '/var/log/clamav':
    ensure  => directory,
    owner   => $clamav_user,
    group   => $clamav_group,
    mode    => '0750',
    require => Package['clamav'],
  }
}
