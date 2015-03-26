class compliance::logindefs {

# Set configuration parameters with augeas
  augeas {'logindefs':
    context => '/files/etc/login.defs',
    lens    => 'login_defs.lns',
    incl    => '/etc/login.defs',
    changes => [
      'set UID_MIN 600',
      'set GID_MIN 600',
      'set PASS_MAX_DAYS 60',
      'set PASS_MIN_DAYS 7',
      'set PASS_MIN_LEN 8',
      'set PASS_WARN_AGE 14',
      'set UMASK 077',
      'set MD5_CRYPT_ENAB yes',
      'set ENCRYPT_METHOD MD5',
      'set FAIL_DELAY 5',
      ],
  }

# Ensure file permission, owner and group are set
  file { '/etc/login.defs':
    owner   => root,
    group   => root,
    mode    => '0640',
    require => Augeas['logindefs'];
  }
}
