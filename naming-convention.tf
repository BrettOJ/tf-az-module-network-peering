module "vnet_resource_name" {
  source        = "git::https://github.com/BrettOJ/tf-az-module-naming-convention?ref=main"
  name_format   = "res_type|-|site|env|app|-|name|-|dest"
  resource_type = "vnp"
  naming_convention_info = {
    "${var.naming_convention_info.name}" = {
      name_info = var.naming_convention_info
      tags = var.tags
    }
  }
}

