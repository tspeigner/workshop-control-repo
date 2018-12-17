# This class configures PE node groups for the Bolt & PE Workshops
#
# @summary Configures PE node groups for the Bolt & PE Workshops
#
# @example
#   include role::workshop
class profile::workshop_classification {
  pe_node_group { 'Workshop':
    ensure      => 'present',
    classes     => {
      'role::workshop' => {},
    },
    environment => 'production',
    parent      => 'All Nodes',
    rule        => ['or',
      ['=', 'name', 'master.inf.puppet.vm']
    ],
  }
}
