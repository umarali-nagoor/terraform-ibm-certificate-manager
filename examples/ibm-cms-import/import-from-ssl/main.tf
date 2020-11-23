############################################################################
# IBM Cloud certificate manager Provisioning, Import and order Certificates
# Copyright 2020 IBM
############################################################################

data "ibm_resource_instance" "cms_instance" {
  name     = var.service_intance_name
  location = var.region
  service  = "cloudcerts"
}
resource "null_resource" "import" {
  provisioner "local-exec" {
    command = <<EOT
openssl req -x509  \
          -newkey rsa:1024 \
          -keyout "${var.ssl_key}" \
          -out "${var.ssl_cert}" \
          -days 1 -nodes \
          -subj "/C="${var.ssl_country}"/ST="${var.ssl_state}"/L="${var.ssl_location}"/O="${var.ssl_org}"/OU="${var.ssl_ou}"/CN="${var.host}"" 
      EOT
  }
}
#datasource to read local certificate file...
data "local_file" "cert" {
  filename   = "${path.module}/${var.ssl_cert}"
  depends_on = [null_resource.import]
}
#datasource to read local priv_key file...
data "local_file" "key" {
  filename   = "${path.module}/${var.ssl_key}"
  depends_on = [null_resource.import]
}

module "import_from_ssl" {
  source                          = "terraform-ibm-modules/certificate-manager/ibm//modules/ibm-cms-import"
  certificate_manager_instance_id = data.ibm_resource_instance.cms_instance.id
  name                            = var.name
  description                     = var.description
  certificate_file                = data.local_file.cert.content
  priv_key_file                   = data.local_file.key.content
  intermediate_certificate_file   = var.intermediate_certificate_file
}
