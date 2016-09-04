class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.references :area, index: true, foreign_key: true
      t.text :description
      t.string :alternate_url
      t.string :name
      t.boolean :archived
      t.string :type_name
      t.datetime :published_at

      t.timestamps null: false
    end
  end
end
