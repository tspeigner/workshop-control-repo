class boltstudent::win_packages {

Package {ensure => latest, provider => chocolatey,}

$winpacks = lookup('bolt_student::win_packages:winpacks')

  package { $winpacks: }
}
