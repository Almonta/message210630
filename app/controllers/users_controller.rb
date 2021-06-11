class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      # @user.authenticate(user_params)
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  def show
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(current_user.id) , notice: '投稿成功'
    else
      render :edit
    end
  end
  def edit
    @user = User.find(current_user.id)
  end
  def confirm
    @user = current_user.pictures.build(user_params)
    render :new if @user.invalid?
  end
end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end

