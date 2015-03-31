class pangalink::nginx::supervisor {
  file { '/etc/supervisor/conf.d/nginx.conf':
    ensure => present,
    source => 'puppet:///modules/pangalink/etc/supervisor/conf.d/nginx.conf',
    mode => 644
  }
}
