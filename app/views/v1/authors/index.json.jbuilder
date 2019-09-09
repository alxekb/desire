json.authors @users do |user|
  json.name      user.name
  json.signature user.signature
end
