class AdminController < ApplicationController
    include EmployeeModule

    # show the expense report of the employee expenses
    def show
       # if params[:id]>0
        render(json: {sucess: "the employee expenses are #{expense_report(params[:id])}"},status: 200)
       # else
         #   render(json: {error: "the employee id is not found"},status: 200)
        #end
    end

    # admin can reject the expenses by based on received expense_id
    def reject_expenses
        @expense=Expense.find(reject_params[:expense_id])
        @expense.update!(:status => "rejected")
        render(json: {success: "the rejected expense id is #{expense.id}"},status: 200)
    end

    def reject_params
        params.permit(:expense_id)
    end
end