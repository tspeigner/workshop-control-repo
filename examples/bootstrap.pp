class profile::bolt_student::bootstrap {
  include ::profile::bolt_student::puppet_agent

  # Determine which package class to use based on kernal type
  case $::kernel {
    'windows': {
      include ::profile::bolt_student::win_packages
    }
    'Linux':   {
      include ::profile::bolt_student::lin_packages
    }
    default: {
      fail('Unsupported operating system!')

    }
  }
}
