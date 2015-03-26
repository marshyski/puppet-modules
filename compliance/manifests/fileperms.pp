class compliance::fileperms {

# Set permissions and ownership of files and directories
  file {
  '/etc/xinetd.conf':
    owner    => root,
    group    => root,
    mode     => '0644';
  "/var/account/pacct*":
    owner    => root,
    group    => root,
    mode     => '0444';
  '/etc/mnttab':
    owner    => root,
    group    => root,
    mode     => '0644';
  '/etc/passwd':
    owner    => root,
    group    => root,
    mode     => '0644';
  '/etc/group':
    owner    => root,
    group    => root,
    mode     => '0644';
  '/root':
    owner    => root,
    group    => root,
    mode     => '0700';
  '/etc/sysconfig/sendmail':
    owner    => root,
    group    => root,
    mode     => '0644';
  '/etc/rc.d/rc.sysinit':
    owner    => root,
    group    => root,
    mode     => '0700';
  '/etc/gshadow':
    owner    => root,
    group    => root,
    mode     => '0400';
  '/etc/bashrc':
    owner    => root,
    group    => root,
    mode     => '0444';
  '/root/.tcshrc':
    owner    => root,
    group    => root,
    mode     => '0400';
  '/etc/csh.cshrc':
    owner    => root,
    group    => root,
    mode     => '0444';
  '/etc/csh.login':
    owner    => root,
    group    => root,
    mode     => '0444';
  '/etc/securetty':
    owner    => root,
    group    => root,
    mode     => '0400';
  '/etc/exports':
    owner    => root,
    group    => root,
    mode     => '0644';
  '/tmp':
    owner    => root,
    group    => root,
    mode     => '+t';
  '/root/.cshrc':
    owner    => root,
    group    => root,
    mode     => '0400';
  '/root/.bash_profile':
    owner    => root,
    group    => root,
    mode     => '0400';
  '/root/.bashrc':
    owner    => root,
    group    => root,
    mode     => '0400';
  '/etc/security/limits.conf':
    owner    => root,
    group    => root,
    mode     => '0644';
  '/etc/krb5.keytab':
    owner    => root,
    group    => root,
    mode     => '0755';
  '/etc/profile':
    owner    => root,
    group    => root, 
    mode     => 444;
    }
}
