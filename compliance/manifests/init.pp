class compliance {
  include compliance::fileperms
  include compliance::ssh
  include compliance::varlog
  include compliance::logindefs
  include compliance::modprobe
  include compliance::auditd
  include compliance::issue 
  include compliance::users
  include compliance::services
  include compliance::packages
  include compliance::pam
}
