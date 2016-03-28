class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.string :content, null: false
      t.boolean :published, null: false

      t.timestamps null: false
    end
  end
end
