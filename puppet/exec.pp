exec { 'touch':
  path => ['/bin'],
  cwd => '/tmp',
  command => 'echo "teste" > testfile.txt',
  creates => '/tmp/testfile.txt',
  returns => [0],
  logoutput => on_failure,
}
