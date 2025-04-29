class web{

Exec { path => '/bin/:/sbin/:/usr/bin/:/usr/sbin/'}

exec { "apt-update":
  command => "/usr/bin/apt-get update"
}

package {[
        "php7.4",
        "php-pear",
        "php7.4-curl",
        "php7.4-gd",
        "php7.4-intl",
        "php7.4-xmlrpc",
        "php7.4-mysql",
        "apache2",
        "python3-mysqldb",
        "wget",
        "curl",
        "vim",
        "zip",
        ]:
        ensure => installed,
        require => Exec["apt-update"],
}

file {'/etc/apache2/conf-available/direxpress.conf':
  ensure => present,
  owner => root,
  group => root,
  mode => '0664',
  replace => true,
  content => template("/vagrant/manifests/direxpress.conf"),
  require => Package["apache2"],
}

file {'/etc/apache2/sites-available/express.conf':
  ensure => present,
  owner => root,
  group => root,
  mode => '0664',
  replace => true,
  content => template('/vagrant/manifests/express.conf'),
  require => Package["apache2"],
}

file {'/etc/hosts':
  ensure => present,
  owner => root,
  group => root,
  mode => '0664',
  replace => true,
  content => template('/vagrant/manifests/hosts.conf'),
}

file { '/srv/www':
  ensure => 'directory',
  owner => 'root',
  group => 'www-data',
  mode => '2750',
}


exec { "wget-express.zip":
  cwd => '/tmp',
  command => "/usr/bin/wget --no-check-certificate https://github.com/rogerramossilva/devops/raw/master/express.zip",
  creates => "/tmp/express.zip",
  require => Package["wget"],
  #refreshonly => true,
}

exec { "unzip":
  cwd => "/srv/www",
  command => "/usr/bin/unzip /tmp/express.zip -d /srv/www",
  creates => "/tmp/express.zip",
  require => Package["zip"],
  #refreshonly => true,
}

service { 'apache2':
  ensure   => 'running',
  enable   => 'true',
  hasrestart => true,
  restart => true,
  require => Package['apache2'],
}

exec { 'a2ensite express':
  path => ['/usr/bin', '/usr/sbin',],
  provider => shell,
  require => Service["apache2"],
  notify => Service ["apache2],
}

exec { 'a2enconf direxpress':
  path => ['/usr/bin', '/usr/sbin',],
  provider => shell,
  require => Service["apache2"],
  notify => Service ["apache2],
}

exec { 'a2enmod vhost_alias':
  path => ['/usr/bin', '/usr/sbin',],
  provider => shell,
  require => Service["apache2"],
  notify => Service ["apache2],
}

exec { 'a2enmod php7.4':
  path => ['/usr/bin', '/usr/sbin',],
  provider => shell,
  require => Service["apache2"],
  notify => Service ["apache2],
 }


}

include web
