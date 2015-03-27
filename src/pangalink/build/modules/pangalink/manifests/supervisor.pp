class pangalink::supervisor {
  file { '/etc/supervisor/conf.d/pangalink.conf':
    ensure => present,
    source => 'puppet:///modules/pangalink/etc/supervisor/conf.d/pangalink.conf',
    mode => 644
  }
}
