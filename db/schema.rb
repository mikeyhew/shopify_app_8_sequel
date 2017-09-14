Sequel.migration do
  change do
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:shops) do
      primary_key :id
      column :shopify_domain, "text", :null=>false
      column :shopify_token, "text"
      
      index [:shopify_domain], :name=>:shops_shopify_domain_key, :unique=>true
    end
  end
end
Sequel.migration do
  change do
    self << "SET search_path TO \"$user\", public"
    self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20170913232525_create_shops.rb')"
  end
end
