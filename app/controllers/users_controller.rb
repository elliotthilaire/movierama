class UsersController < ApplicationController

  def edit
    authorize! :edit, User
    _set_user
  end

  def update
    authorize! :update, User
    _set_user

    if @current_user.update(_update_params)
      flash[:notice] = "Preferences updated"
      redirect_to edit_user_url
    else
      flash[:error] = "Errors were detected"
      render 'edit'
    end
  end

  private

  def _set_user
    @current_user = current_user
  end

  def _update_params
    params.permit(:email)
  end

end
