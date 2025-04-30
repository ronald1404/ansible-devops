file { '/etc/teste.txt':
  mode     => '0664',
  content  => '$contents'
}
# Para diretório
# file { '/tmp/dir':
# ensure => 'directory',
# owner => 'root',
# group => 'root',
# mode => '0644',
# }
