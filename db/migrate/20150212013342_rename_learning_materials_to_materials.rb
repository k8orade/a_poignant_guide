class RenameLearningMaterialsToMaterials < ActiveRecord::Migration
  def change
    rename_table :learning_materials, :materials
  end
end
