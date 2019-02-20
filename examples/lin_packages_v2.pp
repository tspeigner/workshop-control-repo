class profile::bolt_student::lin_packages {

Package {ensure => latest,}

$linpacks = lookup('profile::bolt_student::lin_packages::linpacks')

  package { $linpacks: }
  }
