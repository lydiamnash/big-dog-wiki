class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :creator, index: true

      t.timestamps null: false
    end
  end
end
