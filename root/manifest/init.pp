# Manage root's account and change root's password

class superuser {

	# Manage root account
	user  { 'root':
          ensure     => present,
          uid        => '0',
          gid        => '0',
          shell      => '/bin/bash',
          home       => '/root',
          managehome => true,
	}

        file { '/root':
	  ensure  => directory,
          owner   => root,
          group   => root,
          mode    => '0700',
	  require => User['root'],
	}

        exec { 'reset roots password to something random':
          command => '/root/randomz/root_passwd.sh',
          require => User['root'],
        }

        exec { 'remove acl from roots home':
          command => '/usr/bin/setfacl -b /root',
          require => User['root'],
        }

	# Keep password expirary and change password expire age to the future
	exec { 'reset account age root':
  	  command     => '/usr/bin/chage -d 19877 root',
  	  refreshonly => true,
	  require     => User['root'],
	}
}
