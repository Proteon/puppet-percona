# == Class: percona
#
# Setup the apt repository for Percona. Installation of packages is done from
# other classes/defines.
#
# required modules: puppetlabs/puppet-apt
#
# === Parameters
#
# N/A
#
# === Variables
#
# N/A
#
# === Examples
#
# TBD
#
# === Authors
#
# Proteon
#
# === Copyright
#
# Copyright 2013 Proteon
#
class percona {
    apt::source { 'percona':
        location   => 'http://repo.percona.com/apt',
        release    => $::lsbdistcodename,
        repos      => 'main',
        key        => 'CD2EFD2A',
        key_server => 'keys.gnupg.net',
    }
}
