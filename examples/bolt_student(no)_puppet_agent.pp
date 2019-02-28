class profile::bolt_student(id)_puppet_agent.pp {

  service { 'puppet':
    ensure => running,
    enable => true
  }

}
