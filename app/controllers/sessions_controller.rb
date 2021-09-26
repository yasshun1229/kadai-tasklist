class SessionsController < ApplicationController
  def index
  end
  
  def show
    if logged_in?
      @task = current_user.tasks.build # form_with 用
      @pagy, @tasks = pagy(current_user.tasks.order(id: :desc))
    end
  end
  
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = "ログインに成功しました"
      redirect_to root_path
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new
    end
  end
  
  def edit
  end
  
  def update
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "ログアウトしました"
    redirect_to login_path
  end
  
  private
  
  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
