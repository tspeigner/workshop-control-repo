class role::bolt_student(id) {
  include profile::base_applications
  include profile::bolt_student(id)_puppet_agent
}
