class AddStatusToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :status, :integer, :default => 0 
  end
end
