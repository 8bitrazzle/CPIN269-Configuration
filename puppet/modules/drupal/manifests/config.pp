class drupal::config {

    file {'/usr/site/lab/sbin/run_puppet':
	ensure	=> present,
	owner	=> 'root',
	mode	=> '0550',
	source	=> "puppet:///modules/drupal/usr/site/lab/sbin/run_puppet",
	}
    file { "/etc/httpd/conf/httpd.conf":
	source  => "puppet:///modules/drupal/etc/httpd/conf/httpd.conf",
	require => Class["drupal::packages"],
	notify  => Service["httpd"],
	}
    
    service { "httpd":
	ensure  => $run_services,
	enable  => true,
	require => Class["drupal::packages"],
	}
    service { "mariadb":
        ensure  => $run_services,
        enable  => true,
        require => Class["drupal::packages"],
        }
    service { "firewalld":
        ensure  => stopped,
        enable  => false,
        }
}
