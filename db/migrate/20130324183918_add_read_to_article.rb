class AddReadToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :read, :boolean
  end
end
