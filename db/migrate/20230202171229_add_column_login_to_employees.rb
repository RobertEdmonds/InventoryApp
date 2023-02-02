class AddColumnLoginToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :amount_of_logins, :integer
  end
end
