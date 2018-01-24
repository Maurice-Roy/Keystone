class CreateArchitectures < ActiveRecord::Migration[5.1]
  def change
    create_table :architectures do |t|
      t.string :name
      t.string :style
      t.string :picture_url
      t.belongs_to :city, foreign_key: true
      t.belongs_to :artist, foreign_key: true

      t.timestamps
    end
  end
end
