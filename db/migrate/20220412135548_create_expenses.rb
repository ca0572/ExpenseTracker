class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :invoice_id
      t.date :date
      t.string :discription
      t.float :amount
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
