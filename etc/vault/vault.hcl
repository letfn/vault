ui = true

disable_mlock = true

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

service_registration "consul" {
  address = "169.254.32.1:8500"
}
