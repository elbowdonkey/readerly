class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :config

      t.timestamps
    end
  end
end
