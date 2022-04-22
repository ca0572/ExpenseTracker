class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :phone_no
      t.string :employee_name
      t.string :email_id
      t.string :employee_department
      t.string :status

      t.timestamps
    end
  end
end
