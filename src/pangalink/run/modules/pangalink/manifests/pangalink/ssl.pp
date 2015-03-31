class pangalink::httpd::ssl {
  bash_exec { 'mkdir -p /pangalink/ssl': }

  bash_exec { 'mkdir -p /pangalink/ssl/private':
    require => Bash_exec['mkdir -p /pangalink/ssl']
  }

  bash_exec { 'mkdir -p /pangalink/ssl/certs':
    require => Bash_exec['mkdir -p /pangalink/ssl/private']
  }

  file { '/root/opensslCA.cnf':
    ensure => present,
    content => template('pangalink/opensslCA.cnf.erb'),
    require => Bash_exec['mkdir -p /pangalink/ssl/certs']
  }

  bash_exec { 'openssl genrsa -out /pangalink/ssl/private/pangalinkCA.key 4096':
    timeout => 0,
    require => File['/root/opensslCA.cnf']
  }

  bash_exec { "openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /pangalink/ssl/private/pangalinkCA.key -out /pangalink/ssl/certs/pangalinkCA.crt":
    timeout => 0,
    require => Bash_exec['openssl genrsa -out /pangalink/ssl/private/pangalinkCA.key 4096']
  }

  bash_exec { 'openssl genrsa -out /pangalink/ssl/private/pangalink.key 4096':
    timeout => 0,
    require => Bash_exec["openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /pangalink/ssl/private/pangalinkCA.key -out /pangalink/ssl/certs/pangalinkCA.crt"]
  }

  file { '/root/openssl.cnf':
    ensure => present,
    content => template('pangalink/openssl.cnf.erb'),
    require => Bash_exec['openssl genrsa -out /pangalink/ssl/private/pangalink.key 4096']
  }

  bash_exec { "openssl req -sha256 -new -config /root/openssl.cnf -key /pangalink/ssl/private/pangalink.key -out /pangalink/ssl/certs/pangalink.csr":
    timeout => 0,
    require => File['/root/openssl.cnf']
  }

  bash_exec { "openssl x509 -req -sha256 -CAcreateserial -days 3650 -extensions v3_req -extfile /root/opensslCA.cnf -in /pangalink/ssl/certs/pangalink.csr -CA /pangalink/ssl/certs/pangalinkCA.crt -CAkey /pangalink/ssl/private/pangalinkCA.key -out /pangalink/ssl/certs/pangalink.crt":
    timeout => 0,
    require => Bash_exec["openssl req -sha256 -new -config /root/openssl.cnf -key /pangalink/ssl/private/pangalink.key -out /pangalink/ssl/certs/pangalink.csr"]
  }
}
