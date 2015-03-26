class compliance::issue {

# Set Message of The Day file
  file {
  '/etc/motd':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0444',
    backup  => false,
    content => template('compliance/motd');

# Set issue banner for SSH
  '/etc/issue':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0444',
    backup  => false,
    content => template('compliance/issue');

# Set issue.net banner for SSH
  '/etc/issue.net':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0444',
    backup  => false,
    content => template('compliance/issue.net');
  }
}
