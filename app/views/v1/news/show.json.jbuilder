json.news do
  json.title   @post.title
  json.notice  @post.notice
  json.content @post.content
end

json.author do
  json.name      @post.author.name
  json.signature @post.author.signature
end
