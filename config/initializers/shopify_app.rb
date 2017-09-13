ShopifyApp::SessionRepository.send :define_singleton_method, :load_storage do
  Shop
end

ShopifyApp.configure do |config|
  config.application_name = "My Sequel Shopify App"
  config.embedded_app = true
  config.api_key = ENV['SHOPIFY_API_KEY'] || (raise "Missing SHOPIFY_API_KEY")
  config.secret = ENV['SHOPIFY_SECRET'] || (raise "Missing SHOPIFY_SECRET")
  config.scope = 'write_products, write_orders'
  # webhooks_hostname = ENV['WEBHOOKS_HOSTNAME']
  # raise "Missing WEBHOOKS_HOSTNAME" unless webhooks_hostname.present?
  # config.webhooks = [
  #   # {topic: 'orders/create', address: "https://#{webhooks_hostname}/webhooks/new_order"}
  # ]
end
