json.news @news do |n|
  json.news_id n.id
  json.title   n.title
  json.notice  n.notice
  json.content n.content
end
