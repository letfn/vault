ui = true

listener "tcp" {
  address = "0.0.0.0:8200"
  cluster_address = "0.0.0.0:8201"
  tls_disable = "true"
}

storage "consul" {
  address = "169.254.32.1:8500"
  path    = "vault/"

  disable_registration = "true"
}

disable_mlock = true

api_addr = "http://172.31.xxx.54:8200"
cluster_addr = "https://172l.31.xxx.54:8201"
