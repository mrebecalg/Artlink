class ProfilesController < ApplicationController
  before_action :set_profile
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  private

  def correct_user
    redirect_to(root_path) unless current_user == @profile.user
  end
  def show
    @profile = current_user.profile || current_user.create_profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile), notice: 'Perfil actualizado con éxito.'
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:bio, :username, :twitter, :facebook, :instagram)
  end
end
