module V1
  class NewsController < ApplicationController
    before_action :authorize_request, only: %i[create update]
    before_action :set_post,          only: %i[show update]
    include NewsReader

    def index
      @news = Post.where('created_at > ?', Date.today - 14.days)
      # if a user include his token to the request
      # this will show him only latest news.
      if token_present?
        authorize_request
        @news = @news - current_user.news
      else
        @news
      end
    end

    def show
      # if a user provide his token
      # this block will update news read status for the user
      read_news(@post.id) if token_present?
    end

    def create
      @news = current_user.posts.create!(post_params)
      json_response(@news, :created)
    end

    def update
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
      params.permit(:id, :title, :notice, :content, :published, :unread)
    end

    def token_present?
      request.headers['Authorization'].present? ? true : false
    end

    def read_news(post)
      authorize_request
      mark_as_read(post, current_user)
    end
  end
end
