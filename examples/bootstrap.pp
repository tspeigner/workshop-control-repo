class role::boltstudent::bootstrap {
  include profile::boltstudent::puppet_agent
  include profile::boltstudent::packages
}
