# === Authors
#
# Jason Edgecombe <jason@rampaginggeek.com>
#
# === Copyright
#
# Copyright 2013 Jason Edgecombe, unless otherwise noted.
#
class kerberos::params {

  case $::operatingsystem {
    Ubuntu: {
      $client_packages    = [ 'krb5-user' ]
      $kdc_server_packages    = [ 'krb5-kdc' ]
      $kdc_service_name       = 'krb5-kdc'
      $kdc_required_dirs      = [ '/var/lib/krb5kdc',
                                  '/etc/krb5kdc', ]
      $kadmin_server_packages = [ 'krb5-admin-server' ]
      $kadmin_service_name    = 'krb5-admin-server'
      $krb5_conf_path         = '/etc/krb5.conf'
      $kdc_conf_path          = '/etc/krb5kdc/kdc.conf'
      $kadm5_acl_path         = '/etc/krb5kdc/kadm5.acl'
      $krb5kdc_database_path  = '/var/lib/krb5kdc/principal'
      $admin_keytab_path      = '/etc/krb5kdc/kadm5.keytab'
      $key_stash_path         = '/etc/krb5kdc/stash'
    }
    CentOS, RedHat, Amazon: {
      $client_packages         = [ 'krb5-libs',
                                   'krb5-workstation',]
      $kdc_server_packages     = [ 'krb5-libs',
                                   'krb5-server',
                                   'krb5-workstation',]
      $kdc_service_name        = 'krb5kdc'
      $kdc_required_dirs       = [ '/var/kerberos',
                                   '/var/kerberos/krb5kdc', ]
      $kadmin_server_packages  = [ 'krb5-libs',
                                   'krb5-server', ]
      $kadmin_service_name     = 'kadmin'
      $krb5_conf_path          = '/etc/krb5.conf'
      $kdc_conf_path           = '/var/kerberos/krb5kdc/kdc.conf'
      $kadm5_acl_path          = '/var/kerberos/krb5kdc/kadm5.acl'
      $krb5kdc_database_path   = '/var/kerberos/krb5kdc/principal'
      $admin_keytab_path       = '/var/kerberos/krb5kdc/kadm5.keytab'
      $key_stash_path          = '/var/kerberos/krb5kdc/stash'
    }
    default: {
      fail("The ${module_name} module is not supported on ${::osfamily} based systems")
    }
  }
}
