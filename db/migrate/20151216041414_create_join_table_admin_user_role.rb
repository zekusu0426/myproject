class CreateJoinTableAdminUserRole < ActiveRecord::Migration
  def change
    create_join_table :admin_users, :roles do |t|
      # t.index [:admin_user_id, :role_id]
      # t.index [:role_id, :admin_user_id]
    end
  end
end
