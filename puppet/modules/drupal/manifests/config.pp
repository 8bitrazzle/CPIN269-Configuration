class drupal::config {

    file { "/var/www/html":
	ensure  => directory,
	owner   => "apache",
	group   => "apache",
	recursive => true,
	require => Class["drupal::packages"],
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
        }
    service { "firewalld":
        ensure  => stopped,
        enable  => false,
        }
}
