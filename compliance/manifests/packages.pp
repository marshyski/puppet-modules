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

 # Remove ypbind and yp-tools
  exec { 'remove ypbind':
    command => '/usr/bin/yum remove -y ypbind',
    onlyif  => '/bin/rpm -qa | /bin/grep -i ^ypbind',
  }

}
