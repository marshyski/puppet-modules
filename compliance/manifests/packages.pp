class compliance::packages {

# Remove packages
  package {
    [
    'dovecot',
    'inetd',
    'ipsec-tools',
    'irda-utils',
    'isdn4k-utils',
    'rsh-server',
    'rsh',
    'talk',
    'telnet-server',
    'vnc-server',
    'tftp-server',
    'vsftpd',
    'ftp',
    'xinetd',
    'nmap',
    'wireshark',
    'setroubleshoot',
    'acpid',
    'ypbind',
    'octive',
    'rdate',
    'gnome-games',
    'zsh',
    'valgrind',
    'rcs',
    'compiz',
    'tigervnc-server',
    'oprofile',
    'mtr',
    'tcsh',
    'nc',
    ]:
      ensure => absent,
  }
}
