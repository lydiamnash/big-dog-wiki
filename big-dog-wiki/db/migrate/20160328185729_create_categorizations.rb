class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.references :category, null: false
      t.references :version, index: true

      t.timestamps null: false
    end
  end
end
