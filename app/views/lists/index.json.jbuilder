json.array!(@lists) do |list|
  json.extract! list, :id, :listname, :category_id, :area_id
  json.url list_url(list, format: :json)
end
