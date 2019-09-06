module V1
  class NewsController < ApplicationController
    before_action :authorize_request, except: :create
    include NewsReader

    def index
      @news = Post.last(6)
    end

    def show
      @post = Post.find_by(id: params[:id])
      mark_as_read @post
    end

    def create; end

    private

    def post_params
      params.require(:post).permit(:id)
    end
  end
end
