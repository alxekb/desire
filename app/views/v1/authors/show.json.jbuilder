json.author do
  json.signature @author.signature
end

json.news @posts do |post|
  json.title   post.title
  json.notice  post.notice
  json.content post.content
end
