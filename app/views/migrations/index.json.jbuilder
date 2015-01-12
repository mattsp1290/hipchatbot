json.array!(@migrations) do |migration|
  json.extract! migration, :id, :number, :owner
  json.url migration_url(migration, format: :json)
end
