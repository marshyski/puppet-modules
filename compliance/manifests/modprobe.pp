class compliance::modprobe {

# Set content of modprobe module for RHEL6
  if $lsbmajdistrelease == '6' {
    file { '/etc/modprobe.d/ipv6.conf':
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0600',
      content => 'options ipv6 disable=1',
    }
  }

# Set content of modprobe configuration for RHEL5
  if $lsbmajdistrelease == '5' {
    file { '/etc/modprobe.conf':
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0600',
      content => 'install ipv6 /bin/true',
    }
  }
}
