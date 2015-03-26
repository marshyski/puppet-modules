class compliance::users {

# Remove system user accounts
  user {
    [
    'games',
    'news',
    'gopher',
    'tcpdump',
    'shutdown',
    'halt',
    'sync',
    'ftp',
    'operator',
    'lp',
    'netdump',
    'pcap',
    'uucp',
    'irc',
    'gnats',
    ]:
      ensure => absent,
  }

# Lock system user accounts
  user {
    [
    'gdm',
    'clamav',
    ]:
      password => '*',
  }
}
