class CreateAuthTokens < ActiveRecord::Migration
  def change
    create_table :auth_tokens do |t|
      t.integer :user_id
      t.string  :token
      t.boolean :valid

      t.timestamps
    end

    add_index :auth_tokens, :user_id
    add_index :auth_tokens, [:user_id, :token]
  end
end
