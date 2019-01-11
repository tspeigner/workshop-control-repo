class bolt_student1::win_packages {

Package {
    ensure   => installed,
    provider => chocolatey,
  }

  package { 'git': }
  package { '7zip': }

}
