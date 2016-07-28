class UsersController < ApplicationController

  def edit
    authorize! :edit, User
    _set_user
    @validator = NullValidator.instance
  end

  def update
    authorize! :update, User
    _set_user

    @current_user.update_attributes(_update_params)
    @validator = UserValidator.new(@current_user)

    if @validator.valid?
      @current_user.save
      flash[:notice] = "Profile updated"
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
