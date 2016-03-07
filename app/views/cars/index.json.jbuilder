json.array!(@cars) do |car|
  json.extract! car, :id, :car_license, :description, :enter_date, :car_category, :car_subcategory
  json.url car_url(car, format: :json)
end
