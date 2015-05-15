class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :cname
      t.string :crating

      t.timestamps null: false
    end
  end
end
