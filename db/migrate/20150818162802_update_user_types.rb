class UpdateUserTypes < ActiveRecord::Migration
  def up
    replace_type 'Teacher', 'User::Teacher'
    replace_type 'Student', 'User::Student'
  end

  def down
    replace_type 'User::Teacher', 'Teacher'
    replace_type 'User::Student', 'Student'
  end

  private

  def replace_type(from, to)
    execute "
    UPDATE users
    SET type='#{to}'
    WHERE type='#{from}'
    " 
  end
end
