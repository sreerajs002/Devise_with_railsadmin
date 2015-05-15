class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :listname
      t.references :category
      t.references :area

      t.timestamps null: false
    end
  end
end
