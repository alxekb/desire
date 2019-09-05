class V1::AuthenticateController < ApplicationController
  before_action :authorize_request, except: :login

  def login
    @user = User.find_by(login: params[:login])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      render json: { token: token, username: @user.login }
    else
      unauthorized_request
    end
  end

  private

  def login_params
    params.permit(:login, :password)
  end
end
