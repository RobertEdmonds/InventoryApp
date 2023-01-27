class RemoveColumnsFromSamples < ActiveRecord::Migration[7.0]
  def change
    remove_column :samples, :user_id, :string
    remove_column :samples, :employee_id, :string
  end
end
