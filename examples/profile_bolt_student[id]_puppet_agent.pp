class profile::bolt_student99_puppet_agent {

  service { 'puppet':
    ensure => running,
    enable => true
  }

}
