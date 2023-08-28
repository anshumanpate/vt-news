class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :headlines
      t.text :short_description
      t.text :description
      t.string :publisher_name
      t.references :state, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
