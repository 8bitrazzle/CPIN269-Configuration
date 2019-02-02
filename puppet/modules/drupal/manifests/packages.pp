class drupal::packages {
    
    package {
	# a list of packeges goes here.
        [ "httpd",
	  "mariadb-server",
	  "php70w",
	  "php70w-opcache",
	  "php70w-mbstring",
	  "php70w-gd",
	  "php70w-xml",
	  "php70w-pear",
	  "php70w-fpm",
	  "php70w-mysql",
	  "php70w-pdo",

	    ]:
	        ensure => "present";
    }
}

