json.array!(@car_images) do |car_image|
  json.extract! car_image, :id, :image_name
  json.url car_image_url(car_image, format: :json)
end
