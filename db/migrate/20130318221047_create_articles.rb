class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :feed_id
      t.string :title
      t.datetime :published_at
      t.text :content
      t.text :link

      t.timestamps
    end
  end
end
