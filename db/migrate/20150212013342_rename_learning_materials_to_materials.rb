class RenameMaterialsToMaterials < ActiveRecord::Migration
  def change
    rename_table :materials, :materials
  end
end
