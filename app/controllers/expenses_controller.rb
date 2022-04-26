class ExpensesController < ApplicationController

    include EmployeeModule
    before_action :set_employee, only: [:create, :expense_report]
    # to create an expense for a particular employee
    def create
        @expense=@employee.expenses.new(expense_params)
        if @expense.save!
            render(json: {success: "the expense created with #{@expense.id}"},status: 201)
        end
    end

    # validate the expenses created by the employee and sending back tha mail towards the employee when his expense is approved/rejected
    def validate
        @employee=Employee.find(params[:id])
        # to check wheter is employee is onboared or terminated
        if @employee.status=="onboarded"
            
            @employee.expenses.each do |expense|
                puts "the invoice id is #{expense[:invoice_id]}"
               # expense_data=Expense.where(:invoice_id => expense[:invoice_id]).first

                if validate_invoice(expense[:invoice_id])
                    expense.update!(status: "approved")
                 #   expense_data.update!(status: "approved")
                    ExpenseMailer.with(user: @employee.email_id, email_body: "the applied expense amount is #{expense[:amount]} vs the approved expense amount is #{expense[:amount]}").expense_report_mail.deliver_later  
                else    
                    expense.update!(status: "rejected")
                    #expense_data.update!(status: "rejected")
                    ExpenseMailer.with(user: @employee.email_id, email_body: "the applied expense amount is #{expense[:amount]} is got rejected").expense_report_mail.deliver_later
                end
                    
            end
            render(json: {success: "the expenses are validated"},status: 200)
        else
            render(json: {success: "the employee is #{@employee.status}"},status: 200)
        end
        
    end

    def expense_report
        render :expense_report
    end

  #  def validate_params
   #     params.permit(:employee_id)
   # end

   # created expense is valid or not
    def validate_invoice(invoice_id)
        puts "the invoice_id is #{invoice_id}"
        return invoice_id.to_i % 2 == 0   
    end

    private

    def expense_params
        params.permit(:invoice_id,:discription,:amount)
    end

    def set_employee
        @employee = Employee.find(params[:employee_id])
    end
end
