class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Custom password complexity validation
  validate :password_complexity

  private

  def password_complexity
    if password.present?
      unless password =~ /\d/ && password =~ /[^A-Za-z0-9]/
        errors.add :password, "must include at least one number and one special character"
      end
    end
  end

   # Un usuario tendra un perfil  
  has_one :profile, dependent: :destroy
  after_create :create_profile # Crea un perfil vacío al crear el usuario

  private

  def create_profile
    super if profile.nil?
  end


end
