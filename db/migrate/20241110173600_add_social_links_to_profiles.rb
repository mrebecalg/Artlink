class AddSocialLinksToProfiles < ActiveRecord::Migration[7.0]
  def change
    # Si username ya existe en profiles, comenta esta línea
    add_column :profiles, :username, :string unless column_exists?(:profiles, :username)

    # Agrega solo los campos que no existan
    add_column :profiles, :bio, :text unless column_exists?(:profiles, :bio)
    add_column :profiles, :twitter_url, :string unless column_exists?(:profiles, :twitter_url)
    add_column :profiles, :facebook_url, :string unless column_exists?(:profiles, :facebook_url)
    add_column :profiles, :instagram_url, :string unless column_exists?(:profiles, :instagram_url)
  end
end
