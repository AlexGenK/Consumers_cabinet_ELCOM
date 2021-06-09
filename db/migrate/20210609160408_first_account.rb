class FirstAccount < ActiveRecord::Migration[6.1]
  def change
    reversible do |change|
      change.up do
        # Initialize first account:
        User.create! do |u|
          u.email       = 'super@admin.com'
          u.name        = 'admin'
          u.password    = 'password123'
          u.admin_role  = true
          u.client_role = false
        end
      end
    end
  end
end
