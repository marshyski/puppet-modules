# Clone randomz GitHub master branch

class randomz {

  vcsrepo { '/root/randomz':
      ensure   => latest,
      owner    => root,
      group    => root,
      mode     => '0700',
      provider => git,
      source   => 'http://github.com/marshyski/randomz.git',
      revision => 'master',
      require  => Package['git'],
  }

  file {
        [
          '/root/randomz/puppet',
          '/root/randomz/kickstart',
        ]:
          ensure  => absent,
          require => Vcsrepo['/root/randomz'],
  }
}