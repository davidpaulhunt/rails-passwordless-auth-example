class CreateAuthTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_tokens do |t|
      t.string :token, null: false, unique: true
      t.datetime :expires_at, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :auth_tokens, :token, unique: true
    add_index :auth_tokens, :user_id
  end
end
