class CreateArchitects < ActiveRecord::Migration[5.1]
  def change
    create_table :architects do |t|
      t.string :name

      t.timestamps
    end
  end
end
