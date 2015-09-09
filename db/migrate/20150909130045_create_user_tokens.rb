class CreateUserTokens < ActiveRecord::Migration
  def change
    create_table :user_tokens do |t|
      t.string :token
      t.string :refresh_token
      
      t.datetime :expires_at
      t.references :user, index: true
    end
  end
end
