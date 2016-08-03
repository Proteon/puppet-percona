#
class percona::monitoring (
    $cluster_size_critical = '2',
    $cluster_size_warning = '2',
) {

    if $lsbdistcodename == 'xenial' {
        fail('package percona-nagios-plugins not available yet')
    }

    ensure_packages('percona-nagios-plugins')

    file { '/etc/nagios/nrpe.d/percona_cluster_checks.cfg':
        ensure     => 'present',
        owner      => 'root',
        group      => 'root',
        mode       => '0644',
        content    => template("percona/percona_cluster_checks.cfg.erb"),
    }

    # The newline in this file is important, DO NOT REMOVE IT!
    file { '/etc/sudoers.d/nagios':
        ensure => 'present',
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        content => 'nagios  ALL=(ALL) NOPASSWD:/usr/lib64/nagios/plugins/pmp-check-mysql-status
',
    }
}
