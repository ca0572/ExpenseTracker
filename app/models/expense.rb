class Expense < ApplicationRecord
  belongs_to :employee
  has_many :comments
  enum :status, [:pending, :approved, :rejected], default: :pending
end