class compliance::pam {

# Remove PAM modules 
  file {
    [
    '/etc/pam.d/cpufreq-selector',
    '/etc/pam.d/dateconfig',
    '/etc/pam.d/dovecot',
    '/etc/pam.d/gdm*',
    '/etc/pam.d/gnome*',
    '/etc/pam.d/pirut',
    '/etc/pam.d/sabayon',
    '/etc/pam.d/samba',
    '/etc/pam.d/vsftpd',
    '/etc/pam.d/xserver',
    ]:
  ensure => absent,
}

# Ensure symbolic link is create for system-auth module
  file { '/etc/pam.d/system-auth':
    ensure => link,
    target => '/etc/pam.d/system-auth-ac',
    }

# Set permissions and ownership of PAM modules
  file { '/etc/pam.d':
    owner   => root,
    group   => root,
    mode    => '0644',
    recurse => true,	    
    ignore  => '/etc/pam.d';
  }
}
