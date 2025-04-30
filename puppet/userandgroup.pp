# vim /etc/puppetlabs/code/environments/production/manifests/userandgroup.pp

# o exemplo pode ser visto consultando 'puppet resource user {nome de usuário existente}'
node {'nome.dominio.com'
user { 'suporte':
  ensure             => 'present',
  comment            => 'suporte',
  gid                => 2000,
  groups             => ['g_suporte'],
  home               => '/home/suporte',
  password           => '$y$j9T$qTb.fZkNYY4IIqnOsW5cV.$JuvNZxb8pVkG7nl94RCkANdJJWHaa5yWFEy9QwcjFw4',
  password_max_age   => 99999,
  password_min_age   => 0,
  password_warn_days => 7,
  provider           => 'useradd',
  shell              => '/bin/bash',
  uid                => 2000,
}

#  o exemplo pode ser visto consultando 'puppet resource group {nome de grupo existente}'
group { 'g_suporte':
  ensure   => 'present',
  gid      => 2000,
}

}
