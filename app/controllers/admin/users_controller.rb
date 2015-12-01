class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @q = User.ransack params[:q]
    @users = @q.result.page(params[:page])
      .per Settings.pagination.users_per_page
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "admin.user.update_success"
    else
      flash[:failed] = t "admin.user.update_fail"
    end
    respond_to do |format|
      format.html {redirect_to admin_users_path}
      format.js
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "admin.user.destroy_success"
    else
      flash[:failed] = t "admin.user.destroy_fail"
    end
    respond_to do |format|
      format.html {redirect_to admin_users_path}
      format.js
    end
  end

  private
  def user_params
    params.require(:user).permit :role
  end
end
