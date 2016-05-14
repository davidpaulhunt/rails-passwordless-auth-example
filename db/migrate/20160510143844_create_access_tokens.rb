class CreateAccessTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :access_tokens do |t|
      t.string :token, null: false, unique: true
      t.datetime :expires_at, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :access_tokens, :token, unique: true
    add_index :access_tokens, :user_id
  end
end
