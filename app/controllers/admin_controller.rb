class AdminController < ApplicationController
    include EmployeeModule

    # show the expense report of the employee expenses
    def show
       # if params[:id]>0
        render :expense_report
       # else
         #   render(json: {error: "the employee id is not found"},status: 200)
        #end
    end
end