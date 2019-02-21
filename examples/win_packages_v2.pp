class profile::boltstudent::win_packages {

Package {ensure => latest, provider => chocolatey,}

$winpacks = lookup('profile::bolt_student::win_packages:winpacks')

  package { $winpacks: }
}
