class bolt_student1::puppet_agent {

  service { 'puppet':
    ensure => running,
    enable => true
  }

}
