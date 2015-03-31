class pangalink::nginx {
  if ! file_exists('/pangalink/ssl/certs/pangalink.crt') {
    require pangalink::nginx::ssl
  }

  file { '/etc/nginx/conf.d/default.conf':
    ensure => present,
    content => template('pangalink/default.conf.erb'),
    mode => 644
  }

  file { '/etc/nginx/conf.d/default-ssl.conf':
    ensure => present,
    content => template('pangalink/default-ssl.conf.erb'),
    mode => 644
  }
}
