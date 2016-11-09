class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :uid,                null: false, default: ""
      t.string :provider,           null: false, default: ""
      t.string :image_url
      t.string :name
      t.string :avatar
      t.string :confirmation_token
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip
      t.timestamps null: false
    end

    execute("UPDATE users SET confirmed_at = NOW()")
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, [:uid,:provider],      unique: true
    add_index :users,  :confirmation_token,  unique: true
    end
end
