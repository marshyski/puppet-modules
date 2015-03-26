class compliance::ssh {

# Ensure SSH daemon is running
  service {'sshd':
    ensure    => running,
    enable    => true,
    hasstatus => true,
    subscribe => Augeas['sshd_config'];
  }

# Set SSH Linux server and client configuration from source file. Set permissions and ownership
  file {
  '/etc/ssh/ssh_config':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0600';

  '/etc/ssh/sshd_config':
    owner   => root,
    group   => root,
    mode    => '0600';
  }

# Set SSH server configuration parameters IAW standards
  augeas {'sshd_config':
    context => '/files/etc/ssh/sshd_config',
    lens    => 'sshd.lns',
    incl    => '/etc/ssh/sshd_config',
    changes => [
      'set Protocol 2',
      'set ServerKeyBits 1024',
      'set SyslogFacility AUTHPRIV',
      'set LogLevel VERBOSE',
      'set LoginGraceTime 2m',
      'set HostbasedAuthentication no',
      'set PermitRootLogin no',
      'set StrictModes yes',
      'set MaxAuthTries 5',
      'set RhostsRSAAuthentication no',
      'set PermitEmptyPasswords no',
      'set PasswordAuthentication yes',
      'set ChallengeResponseAuthentication yes',
      'set GSSAPICleanupCredentials yes',
      'set UsePAM yes',
      'set AllowTCPForwarding no',
      'set GatewayPorts no',
      'set X11Forwarding yes',
      'set X11DisplayOffset 10',
      'set X11UseLocalhost yes',
      'set PrintMotd no',
      'set TCPKeepAlive yes',
      'set UsePrivilegeSeparation yes',
      'set ShowPatchLevel no',
      'set Banner /etc/issue.net',
      'set KbdInteractiveAuthentication yes',
      'set GSSAPIAuthentication no',
      'set UseDNS no',
      ],
  }
}
