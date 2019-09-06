module V1
  class NewsController < ApplicationController
    before_action :authorize_request, only: [:create, :update]
    include NewsReader

    def index
      @news = Post.last(6)
    end

    def show
      @post = Post.find_by(id: params[:id])
      if token_present?
        authorize_request
        mark_as_read(@post.id, current_user.id)
      end
    end

    def create
      @news = current_user.posts.create!(post_params)
      json_response(@news, :created)
    end

    def update
      @news = Post.find_by(id: params[:id])
      if current_user.id == @news.user_id
        @news.update(post_params)
        json_response(@news, :updated)
      else
        raise(ExceptionHandler::NotAuthorized, Message.unauthorized_request)
      end
    end

    private

    def post_params
      params.permit(:id, :title, :notice, :content, :published)
    end

    def token_present?
      if request.headers['Authorization'].present?
        true
      else
        false
      end
    end

  end
end
