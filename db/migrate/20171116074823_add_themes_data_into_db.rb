class AddThemesDataIntoDb < ActiveRecord::Migration[5.1]
  def up
    # execute <<-SQL
    #   INSERT INTO spree_themes (id,
    #                             name,
    #                             state,
    #                             template_file_file_name,
    #                             template_file_content_type,
    #                             template_file_file_size,
    #                             template_file_updated_at)
    #   VALUES
    #     (1, 'default', 'published', 'default.zip', 'application/zip', 1097095, '2017-11-15 23:25:00'),
    #     (2, 'theme-BigShop-master', 'drafted', 'theme-BigShop-master.zip', 'application/zip', 423352, '2017-11-15 23:28:00'),
    #     (3, 'theme-ClassicWhite-master', 'drafted', 'theme-ClassicWhite-master.zip', 'application/zip', 1732916, '2017-11-15 23:28:11')
    # SQL
  end

  def down
    # execute 'TRUNCATE TABLE spree_themes'
  end
end
