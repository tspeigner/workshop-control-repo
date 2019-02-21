class profile::boltstudent::win_packages {

Package {ensure => latest, provider => chocolatey,}

$winpacks = [ '7zip', 'git']

package { $winpacks: }
}
