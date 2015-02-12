json.array!(@materials) do |material|
  json.extract! material, :id, :name, :source, :description, :duration, :difficulty
  json.url material_url(material, format: :json)
end
