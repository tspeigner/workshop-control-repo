class boltstudent::lin_packages {

Package {ensure => latest,}

$linpacks = lookup('bolt_student::lin_packages::linpacks')

  package { $linpacks: }
  }
