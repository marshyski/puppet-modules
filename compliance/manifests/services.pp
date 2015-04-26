class compliance::services {

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

  service {
    [
    'crond',
    'atd',  
    ]:
      ensure => running,
      enable => true,
  }
}
