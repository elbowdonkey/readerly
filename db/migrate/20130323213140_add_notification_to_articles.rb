class AddNotificationToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :notification, :text
  end
end
