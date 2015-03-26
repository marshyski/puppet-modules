class compliance::varlog {

# Set correct permissions and ownership to /var/log directories and files
  file {
  '/var/log':
    owner   => root,
    group   => root,
    mode    => '0755';
  '/var/log/audit':
    owner   => root,
    group   => root,
    mode    => '0700';
  '/var/log/all':
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => '0644',
    recurse => true,
    ignore  => '/var/log/all';
  '/var/log/sa':
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => '0600',
    recurse => true,
    ignore  => '/var/log/sa';
  '/var/log/btmp':
    owner   => root,
    group   => utmp,
    mode    => '0600';
  '/var/log/wtmp':
    ensure  => present,
    owner   => root,
    group   => utmp,
    mode    => '0660';
  '/var/log/lastlog':
    owner   => root,
    group   => root,
    mode    => '0644';
  '/etc/cron.d':
    owner   => root,
    group   => root,
    recurse => true,
    mode    => '0700';
  '/etc/cron.daily':
    owner   => root,
    group   => root,
    recurse => true,
    mode    => '0700';
  "/etc/cron.hourly":
    owner   => root,
    group   => root,
    recurse => true,
    mode    => '0700';
  "/etc/cron.monthly":
    owner   => root,
    group   => root,
    recurse => true,
    mode    => '0700';
  "/etc/cron.weekly":
    owner   => root,
    group   => root,
    recurse => true,
    mode    => '0700';
  '/var/log/secure':
    owner   => root,
    group   => root,
    mode    => '0600';
  '/var/log/messages':
    owner   => root,
    group   => root,
    mode    => '0644';
  '/var/log/cups':
    owner   => root,
    group   => root,
    mode    => '0640';
  '/var/log/dmesg':
    owner   => root,
    group   => root,
    mode    => '0640';
  '/var/log/auth.log':
    mode    => '0600';
  "/var/log/scrollkeeper*":
    mode    => 'o-rwx,g-w';
  '/var/log/httpd':
    mode    => 'o-rwx,g-w';
  '/var/log/ksyms':
    mode    => 'o-rwx,g-w';
  "/var/log/maillog*":
    mode    => 'o-rwx,g-rwx';
  '/var/log/mailman':
    mode    => 'o-rwx,g-rwx';
  '/var/log/news':
    mode    => 'o-rwx,g-w';
  '/var/log/pqgsl':
    mode    => 'o-rwx,g-rwx';
  '/var/log/rpmpkgs':
    mode    => 'o-rwx,g-w';
  '/var/log/samba':
    mode    => 'o-rwx,g-rwx';
  "/var/log/spooler*":
    mode    => 'o-rwx,g-rwx';
  '/var/log/squid':
    mode    => 'o-rwx,g-w';
  '/var/log/vbox':
    mode    => 'o-rwx,g-w';
  '/var/log/boot.log':
    mode    => '700';
  '/var/log/ntpstats':
    mode    => 'g-rwx';
  '/var/log/gdm':
    mode    => 'o-w,g-w';
  '/var/log/kernel':
    mode    => 'u-x';
  '/var/log/syslog':
    mode    => 'u-x';
  '/var/log/loginlog':
    mode    => 'u-x';
  }
}
