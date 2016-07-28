class UsersController < ApplicationController

  def edit
    authorize! :edit, User

    @current_user = current_user
    @validator = NullValidator.instance
  end

  def update
    authorize! :update, User

    @current_user = current_user
    @validator = NullValidator.instance

    @current_user.update_attributes(_update_params)

    if @validator.valid?
      @current_user.save
      flash[:notice] = "Preferences updated"
      redirect_to edit_user_url
    else
      flash[:error] = "Errors were detected"
      render 'edit'
    end
  end

  private

  def _update_params
    params.permit(:email)
  end

end
