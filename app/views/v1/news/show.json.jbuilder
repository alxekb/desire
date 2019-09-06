json.news do
  json.title   @post.title
  json.notice  @post.notice
  json.content @post.content
end

json.author do
  json.name      @post.user.name
  json.signature @post.user.signature
end
