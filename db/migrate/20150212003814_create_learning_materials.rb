class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.string :source
      t.text :description
      t.integer :duration
      t.string :difficulty

      t.timestamps null: false
    end
  end
end
