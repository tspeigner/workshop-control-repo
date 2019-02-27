class profile::boltstudent::puppet_agent {

  service { 'puppet':
    ensure => running,
    enable => true
  }

}
