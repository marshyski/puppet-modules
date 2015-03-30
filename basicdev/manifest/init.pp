class basicdev {

  package {
    [
    'curl',
    'bzip2',
    'dos2unix',
    'git',
    'glances',
    'lynx',
    'man',
    'python',
    'rsync',
    'ruby',
    'rubygems',
    'screen',
    'wget',
    'lsof',
    'strace',
    ]:
      ensure => latest,
  }
}
