class root_user {

# Manage root account
# Generate hash openssl passwd -1 'U)x1OwBkH-&pAV@{Qc|0vp!@j!%?esUjIi)C_!cICZZTQu?2_eND2j5_W1avJIgw'
# Password is U)x1OwBkH-&pAV@{Qc|0vp!@j!%?esUjIi)C_!cICZZTQu?2_eND2j5_W1avJIgw
  user  { 'root':
    ensure     => present,
    uid        => '0',
    gid        => '0',
    shell      => '/bin/bash',
    home       => '/root',
    managehome => true,
    password   => '$1$rK9Smsqa$KvNaMUR0JB1QxMWawj3UP.',
  }

  file { '/root':
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => '0700',
    require => User['root'],
  }

  exec { 'remove acl from roots home':
    command => '/usr/bin/setfacl -b /root',
    refreshonly => true,
    require => User['root'],
  }

# Keep password expirary and change password expire age to the future
  exec { 'reset account age root':
   command     => '/usr/bin/chage -d 19877 root',
   refreshonly => true,
   require     => User['root'],
  }
}
