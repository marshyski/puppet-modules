# Set permissions and ownership of cron files, chkconfigs and services

class cron {

	# Set permissions and ownership
	file {
	  '/etc/cron.d':
	    owner   => root,
	    group   => root,
	    mode    => '0700',
	    recurse => true;
	'/etc/cron.monthly':
	    owner   => root,
	    group   => root,
     	    mode    => '0700',
	    recurse => true;
	'/etc/cron.weekly':
     	    owner   => root,
     	    group   => root,
     	    mode    => '0700',
	    recurse => true;
	'/etc/cron.daily':
     	    owner   => root,
     	    group   => root,
     	    mode    => '0700',
	    recurse => true;
	'/etc/cron.hourly':
     	    owner   => root,
     	    group   => root,
     	    mode    => '0700',
	    recurse => true;
	'/etc/cron.allow':
     	    owner => root,
     	    group => root,
     	    mode  => '0400';
	'/etc/cron.deny':
     	    owner => root,
     	    group => root,
     	    mode  => '0400';
	'/etc/crontab':
     	    owner => root,
     	    group => root,
     	    mode  => '0400';
	'/etc/at.allow':
    	    owner => root,
     	    group => root,
     	    mode  => '0400';
	'/etc/at.deny':
     	    owner => root,
     	    group => root,
     	    mode  => '0400';
	'/var/spool/cron':
     	    owner => root,
     	    group => root,
 	    mode  => '0700';
	'/var/spool/cron/root':
     	    owner => root,
     	    group => root,
     	    mode  => '0600';
	'/var/spool/at':
     	    owner => root,
     	    group => root,
     	    mode  => '0700';
	}

	# Stop most likely not used cron services
	service {
	  [
	    'anacron',
	    'atd',
	  ]:
	    ensure => stopped,
	    enable => false,
	}

	# Ensure crond service is running for crontabs
	service	{ 'crond':
	  ensure => running,
	  enable => true,
	}

}
