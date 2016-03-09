json.array!(@car_statuses) do |car_status|
  json.extract! car_status, :id, :description, :status
  json.url car_status_url(car_status, format: :json)
end
