class DowngradeController < ApplicationController
  def new
  end

  def create
    @user = current_user
    @user.update_attributes(role: 'standard')
    @user.make_public

    flash[:notice] = "You have successfully downgraded your account."
    redirect_to root_path
  end
end
