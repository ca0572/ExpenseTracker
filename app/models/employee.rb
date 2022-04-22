class Employee < ApplicationRecord
    has_many :expenses
    validates :phone_no, presence: true
    validates :email_id, presence: true
    validates :employee_name, presence: true
    validates :employee_department, presence: true
end
