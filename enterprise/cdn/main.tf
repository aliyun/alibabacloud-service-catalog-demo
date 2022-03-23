resource "alicloud_cdn_domain_new" "domain" {
  domain_name = var.domain_name
  cdn_type    = var.cdn_type
  scope       = var.scope
  sources {
    content  = var.sources_content
    type     = var.sources_type
    priority = var.sources_priority
    port     = var.sources_port
    weight   = var.sources_weight
  }
}

resource "alicloud_cdn_domain_config" "config" {
  domain_name   = alicloud_cdn_domain_new.domain.domain_name
  function_name = var.function_name
  function_args {
    arg_name  = var.arg_name
    arg_value = var.arg_value
  }
}
