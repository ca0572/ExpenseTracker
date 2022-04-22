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
end