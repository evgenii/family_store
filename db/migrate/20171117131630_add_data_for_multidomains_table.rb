class AddDataForMultidomainsTable < ActiveRecord::Migration[5.1]
  def up
    execute 'truncate table spree_stores'
    execute <<-SQL
      INSERT INTO spree_stores (id, name, url, meta_description, meta_keywords, seo_title, mail_from_address, default_currency, code, `default`, created_at, updated_at, logo_file_name)
      VALUES (1, 'main', 'zvshop.com.ua\r\nwatch.zvshop.com.ua ', 'shop, buy, watch, store', 'shop, buy, watch, store', '', 'shop@zvshop.com.ua', 'UAH', 'spree', 1, '2017-10-26 21:34:54', '2017-11-17 13:01:24', NULL)
    SQL

    execute 'truncate table spree_products_stores'
    execute <<-SQL
      INSERT INTO spree_products_stores (product_id, store_id)
      select product.id as product_id, 1 as store_id
      from spree_products as product
    SQL

    execute 'truncate table spree_store_payment_methods'
    execute <<-SQL
      INSERT INTO spree_store_payment_methods (payment_method_id, store_id, created_at, updated_at)
      select  payment_method.id as payment_method_id,
              1 as store_id,
              now() as created_at,
              now() as updated_at
      from spree_payment_methods as payment_method
    SQL

    execute 'truncate table spree_store_shipping_methods'
    execute <<-SQL
      INSERT INTO spree_store_shipping_methods (shipping_method_id, store_id, created_at, updated_at)
      select  shipping_method.id as shipping_method_id,
              1 as store_id,
              now() as created_at,
              now() as updated_at
      from spree_shipping_methods as shipping_method
    SQL
  end

  def down
    execute 'truncate table spree_stores'
    execute 'truncate table spree_products_stores'
    execute 'truncate table spree_store_payment_methods'
    execute 'truncate table spree_store_shipping_methods'
  end
end
