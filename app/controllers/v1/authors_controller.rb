class V1::AuthorsController < ApplicationController
  def index
    users = User.last(24)
    render json: users
  end
end
