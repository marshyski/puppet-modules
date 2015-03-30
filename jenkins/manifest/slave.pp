class jenkins::slave {

  package {
    [
    'ksh',
    'svn',
    'git',
    'docker',
    'openjdk',
    ]:
      ensure => installed,
  }

}
