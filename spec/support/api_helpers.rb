module ApiHelpers
  def json_body
    JSON.parse(responce.body)
  end
end
