class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :url, null: false
      t.references :version, index: true
      t.timestamps null: false
    end
  end
end
