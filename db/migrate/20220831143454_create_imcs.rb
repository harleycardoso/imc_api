class CreateImcs < ActiveRecord::Migration[5.1]
  def change
    create_table :imcs do |t|
      t.string :name

      t.timestamps
    end
  end
end
