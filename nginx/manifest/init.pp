# Install nginx, setup directories and remove default files
# Dependencies:  EPEL repo enabled

class nginx(
  $nginx_user  = 'nginx',
  $nginx_group = 'nginx',){

# Install NGINX
  package { 'nginx':
     ensure => latest,
  }

# Manage NGINX service
  service { 'nginx':
     ensure    => running,
     enable    => true,
     hasstatus => true,
     require   => Package['nginx'],
  }

# Set nginx service configuration
  file { '/etc/nginx/nginx.conf':
     ensure  => present,
     owner   => $nginx_user,
     group   => $nginx_group,
     mode    => '0640',
     content => template('nginx/nginx.conf.erb'),
     require => Package['nginx'],
  }

# Set default configurations
  file { '/etc/nginx/conf.d/default.conf':
     ensure  => present,
     owner   => $nginx_user,
     group   => $nginx_group,
     mode    => '0640',
     content => template('nginx/default.conf.erb'),
     require => Package['nginx'],
  }

# Set logging directory
  file { '/var/log/nginx':
     ensure  => directory,
     owner   => $nginx_user,
     group   => $nginx_group,
     mode    => '0750',
     require => Package['nginx'],
  }

# Remove default installed files from package
  file {
	[
	  '/usr/share/nginx/html/404.html',
	  '/usr/share/nginx/html/50x.html',
	  '/usr/share/nginx/html/nginx-logo.png',
	  '/usr/share/nginx/html/poweredby.png',
	]:
      	  ensure  => absent,
      	  require => Package['nginx'],
  }
}
