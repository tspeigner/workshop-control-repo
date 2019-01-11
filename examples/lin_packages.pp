class bolt_student1::lin_packages {

  $pkgs = ['unzip','git']

  ensure_packages($pkgs, {ensure => installed})

  if $::osfamily == 'RedHat' {
    include ::epel
  }

}
