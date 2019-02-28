class role::bolt_student[id] {
  include profile::base_applications
  include profile::boltstudent[id]_puppet_agent
}
