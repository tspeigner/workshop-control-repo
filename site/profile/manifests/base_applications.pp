class profile::base_applications {
  case $facts['osfamily'] {
    'windows': {
      $apps = lookup('base_apps::windows')
      $provider = 'chocolatey'
    }
    'RedHat':   {
      $apps = lookup('base_apps::redhat')
      $provider = 'yum'
    }
    default: {
      fail('Unsupported operating system!')
    }
  }
  package {$apps:
    ensure   => installed,
    provider => $provider,
  }
}
