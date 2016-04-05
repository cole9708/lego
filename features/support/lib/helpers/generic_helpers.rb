require 'os'
require 'active_support/time'
module GenericHelpers
  extend self

  def product_configs
    YamlManager.load_config_yml('products')
  end


  end

