class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.references :category, null: false
      t.references :article, null: false

      t.timestamps null: false
    end
  end
end
