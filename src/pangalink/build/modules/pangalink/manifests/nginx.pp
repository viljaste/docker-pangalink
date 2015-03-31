class pangalink::nginx {
  require pangalink::nginx::packages
  require pangalink::nginx::supervisor

  file { '/etc/nginx/conf.d/example_ssl.conf':
    ensure => absent
  }

  file { '/etc/nginx/nginx.conf':
    ensure => present,
    source => 'puppet:///modules/pangalink/etc/nginx/nginx.conf',
    mode => 644
  }
}
