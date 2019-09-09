module V1
  class AuthorsController < ApplicationController
    def index
      @users = User.all
    end

    def show
      @author = User.find_by(id: params[:id])
      @posts = @author.posts
    end

    private

    def authors_params
      params.require(:author).permit(:id)
    end
  end
end
