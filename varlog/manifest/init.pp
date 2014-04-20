# Manage var-log directories and files within

class varlog {

        file {
          '/var/log':
            owner   => root,
            group   => root,
            mode    => '0640',
            recurse => true,
	    ignore  => '/var/log';
          '/var/log/audit':
            ensure  => directory,
	    owner   => root,
            group   => root,
            mode    => '0640',
            recurse => true,
	    ignore  => '/var/log/audit',
	    require => File['/var/log'];
          '/var/log/btmp':
            owner   => root,
            group   => utmp,
            mode    => '0600',
	    require => File['/var/log'];
          '/var/log/wtmp':
	    ensure  => present,
            owner   => root,
            group   => utmp,
            mode    => '0660',
            require => File['/var/log'];
          '/var/log/lastlog':
            owner   => root,
            group   => root,
            mode    => '0600',
            require => File['/var/log'];
	  "/var/log/cron*":
            owner => root,
            group => root,
            mode  => '0600',
	    require => File['/var/log'];
	}

        exec { 'fix /var/log directory mode':
           command => '/bin/chmod -f 0755 /var/log',
           user    => root,
	   group   => root,
           require => File['/var/log'];
        }

        exec { 'fix /var/log/audit directory mode':
           command => '/bin/chmod -f 0700 /var/log/audit',
           user    => root,
           group   => root,
           require => File['/var/log/audit'];
        }

        exec { 'fix /var/log/jenkins directory mode':
           command => '/bin/chmod -f 0750 /var/log/jenkins',
           user    => jenkins,
           group   => jenkins,
           require => [File['/var/log'],Class['jenkins']];
        }

}
