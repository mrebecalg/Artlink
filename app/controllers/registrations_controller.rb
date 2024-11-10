class RegistrationsController < Devise::RegistrationsController
    # Si deseas agregar una configuración personalizada, puedes hacerlo aquí.
    # Pero asegúrate de no eliminar la acción 'new', ya que Devise la necesita.
    
    private
  
    # Ejemplo de método personalizado para procesar atributos adicionales como username
    def sign_up_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
  
    def account_update_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
    end
  end
  