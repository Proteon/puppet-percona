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
class percona (
    $repo_location = 'http://repo.percona.com/apt',
) {
    include percona::secure_installation

    apt::source { 'percona':
        location   => $repo_location,
        release    => $::lsbdistcodename,
        repos      => 'main',
        key        => { 'server' => 'keys.gnupg.net', 'id' => '430BDF5C56E7C94E848EE60C1C4CBDCDCD2EFD2A'},
        #key_server => 'keys.gnupg.net',
    }
}
