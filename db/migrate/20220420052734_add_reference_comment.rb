class AddReferenceComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :expense, index: true
  end
end
