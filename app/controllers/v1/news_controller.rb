class V1::NewsController < ApplicationController
  def index
    news = Post.last(12)
    render json: news
  end
end
