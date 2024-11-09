# db/migrate/xxxx_create_profiles.rb
class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :bio, limit: 160
      t.string :username, limit: 12
      t.string :twitter
      t.string :facebook
      t.string :instagram
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
