class profile::boltstudent::lin_packages {

Package {ensure => latest,}

$linpacks = [ 'unzip', 'git' ]

  package { $linpacks: }
  }
