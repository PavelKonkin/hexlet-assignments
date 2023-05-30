json.array! @users do |user|
  json.extract! user, :id, :first_name, :last_name
  json.url url_for(user)
end