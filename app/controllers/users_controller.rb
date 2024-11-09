class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def change_password
    end
  
    def update_password
      @user = current_user
  
      if @user.update(password_params)
        # Redirige al usuario con un mensaje de éxito
        redirect_to root_path, notice: "La contraseña se ha actualizado exitosamente."
      else
        # Muestra errores y renderiza el formulario de cambio de contraseña nuevamente
        flash.now[:alert] = @user.errors.full_messages.to_sentence
        render :change_password
      end
    end
  
    private
  
    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end
  end
  