class profile::bolt_student::puppet_agent {

  service { 'puppet':
    ensure => running,
    enable => true
  }

}
