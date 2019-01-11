class bolt_student1::bootstrap {
  include ::bolt_student1::puppet_agent

  # Determine which package class to use based on kernal type
  case $::kernel {
    'windows': {
      include ::bolt_student1::win_packages
    }
    'Linux':   {
      include ::bolt_student1::lin_packages
    }
    default: {
      fail('Unsupported operating system!')

    }
  }
}
