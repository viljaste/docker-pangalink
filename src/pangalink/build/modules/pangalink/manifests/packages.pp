class pangalink::packages {
  file { '/tmp/pangalink-net-1.0.2_all.deb':
    ensure => present,
    source => 'puppet:///modules/pangalink/tmp/pangalink-net-1.0.2_all.deb'
  }

  bash_exec { 'dpkg -i /tmp/pangalink-net-1.0.2_all.deb':
    require => File['/tmp/pangalink-net-1.0.2_all.deb']
  }
}
