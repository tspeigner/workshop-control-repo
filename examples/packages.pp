class profile::boltstudent::packages {

  # Determine which package class to use based on kernal type
  case $::kernel {
    'windows': {
      include ::profile::boltstudent::win_packages
    }
    'Linux':   {
      include ::profile::boltstudent::lin_packages
    }
    default: {
      fail('Unsupported operating system!')

    }
  }
}
