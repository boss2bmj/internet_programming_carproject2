json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :gender, :birth_date, :email, :mobile_number, :password
  json.url user_url(user, format: :json)
end
