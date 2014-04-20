class rpmforge(
  $key_url  = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag',
  $repo_url = 'http://apt.sw.be/redhat/el6/en/$basearch/rpmforge',
  $yum_repo = '/etc/yum.repos.d/rpmforge.repo',) {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag':
    owner  => root,
    group  => root,
    mode   => '0440',
    source => 'puppet:///modules/rpmforge/RPM-GPG-KEY-rpmforge-dag',
  }

  yumrepo { 'rpmforge':
    baseurl  => $repo_url,
    descr    => "RHEL $releasever - RPMforge.net",
    enabled  => '1',
    gpgkey   => "$key_url",
    gpgcheck => '1',
    require  => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag'],
  }
