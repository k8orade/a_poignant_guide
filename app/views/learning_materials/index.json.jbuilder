json.array!(@learning_materials) do |learning_material|
  json.extract! learning_material, :id, :name, :source, :description, :duration, :difficulty
  json.url learning_material_url(learning_material, format: :json)
end
