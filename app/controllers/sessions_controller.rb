class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
    else
      flash[:danger] =  'Invalid email/password combination' # 本当は正しくない
    end
      render 'new'
  end

  def destroy
  end
end
