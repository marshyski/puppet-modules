# Remove packages and users, chkconfig off and stop services

class secsys {

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
#           'nmap',
            'tcpdump',
            'wireshark',
	    'setroubleshoot',
	    'sendmail',
	    'postfix',
	    'acpid',
	    'ypbind',
	    'octive',
	    'rdate',
	    'gnome-games',
	    'zsh',
#	    'iptables-ipv6',
	    'valgrind',
	    'rcs',
	    'compiz',
	    'tigervnc-server',
	    'oprofile',
	    'mtr',
	    'tcsh',
	    'nc',
	    'telnet',
	  ]:
	    ensure => absent,
	}

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

	# Lock user accounts
	user {
	  [
	    'gdm',
	    'clamav',
	  ]:
	    password => '*',
	}

	# Chkconfig services off and stop services
	service {
	  [
	    'cups',
	    'dhcpd',
	    'haldaemon',
	    'hplip',
	    'inetd',
	    'kdump',
	    'mdmonitor',
	    'pcscd',
	    'rhnsd',
	    'xfs',
	    'xinetd',
	    'apmd',
	    'bluetooth',
	    'dovecot',
	    'firstboot',
	    'hidd',
	    'irda',
	    'isdn',
	    'kudzu',
	    'microcode_ctl',
	    'iptables',
	    'ip6tables',
	    'mcstrans',
	    'NetworkManager',
	    'abrtd',
	    'abrt-ccpp',
   	    'abrt-oops',
	    'dnsmasq',
	    'multipathd',
	    'psacct',
	    'quota_nld',
	    'sysstat',
	    'saslauthd',
	    'restorecond',
	    'rngd',
	    'smartd',
	    'wpa_supplicant',
	    'netconsole',
	    'rawdevices',
	    'avahi-daemon',
	  ]:
	    ensure => stopped,
	    enable => false,
	}
}
