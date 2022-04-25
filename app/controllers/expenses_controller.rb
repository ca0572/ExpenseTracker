class ExpensesController < ApplicationController

    # to create an expense for a particular employee
    def create
        @employee = Employee.find(params[:employee_id])
        expense_details=expense_params
        expense_details[:status]="pending"
        @expense=@employee.expenses.new(expense_details)
        if @expense.save
            render(json: {success: "the expense created with #{@expense.id}"},status: 201)
        else
            render(json: {error: "received is not matching "}, status: 400)
        end
    end

    # validate the expenses created by the employee and sending back tha mail towards the employee when his expense is approved/rejected
    def validate
      
        @employee=Employee.find(params[:id])
        @employee.expenses.each do |expense|
            puts "the invoice id is #{expense[:invoice_id]}"
            expense_data=Expense.where(:invoice_id => expense[:invoice_id]).first
            if validate_invoice(expense[:invoice_id])
                expense_data.update!(status: "approved")
                ExpenseMailer.with(user: @employee.email_id, email_body: "the applied expense amount is #{expense[:amount]} vs the approved expense amount is #{expense[:amount]}").expense_report_mail.deliver_later  
            else    
                expense_data.update!(status: "rejected")
                ExpenseMailer.with(user: @employee.email_id, email_body: "the applied expense amount is #{expense[:amount]} is got rejected").expense_report_mail.deliver_later
            end
                
        end
        render(json: {success: "the expenses are validated"},status: 200)
        
    end

    def expense_params
        params.permit(:invoice_id,:discription,:amount)
    end
  #  def validate_params
   #     params.permit(:employee_id)
   # end

   # created expense is valid or not
    def validate_invoice(invoice_id)
        return invoice_id.to_i % 2 == 0   
    end
    
end
