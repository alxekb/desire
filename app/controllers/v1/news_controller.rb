module V1
  class NewsController < ApplicationController
    before_action :authorize_request, only: %i[create update]
    before_action :set_post,          only: %i[show   update]
    include NewsReader

    def index
      @news = Post.last(6)
    end

    def show
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
      @post = Post.find_by(id: params[:id])
      if current_user.id == @post.user_id
        @post.update(post_params)
        json_response(@post, :updated)
      else
        raise(ExceptionHandler::NotAuthorized, Message.unauthorized_request)
      end
    end

    private

    def set_post
      @post = Post.find_by(id: params[:id])
    end

    def post_params
      params.permit(:id, :title, :notice, :content, :published)
    end

    def token_present?
      request.headers['Authorization'].present? ? true : false
    end

  end
end
