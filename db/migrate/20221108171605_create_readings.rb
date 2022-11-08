class CreateReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
