class profile::base_applications {
  case $facts['osfamily'] {
    'windows': {

      $apps = lookup('base_apps::windows')

      package { $apps:
        ensure   => latest,
        provider => chocolatey,
      }

    }
    'RedHat':   {

      $apps = lookup('base_apps::redhat')

      package { $apps:
        ensure   => latest,
      }

    }
    default: {
      fail('Unsupported operating system!')
    }
  }
}
