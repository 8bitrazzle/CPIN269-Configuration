class common::packages {

    package {
	'vim-enhanced':
		ensure  => present,
	'net-tools':
		ensure  => present,
	'git':
		ensure  => present,
	'wget':
		ensure  => present,
	'epel-release':
		ensure  => present,
	'htop':
		ensure  => present,
		require => Package['epel-release'],
	}
}
