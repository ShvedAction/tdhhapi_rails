class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name
      t.references :parent, index: true, foreign_key: false

      t.timestamps null: false
    end
  end
end
