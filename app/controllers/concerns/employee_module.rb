module EmployeeModule

    # get the employee object
        def show
            @employee=Employee.find(params[:id])
        if @employee!=nil
            render(json: {success: "the employee data retrived is #{@employee.to_json}"},status: 200) 
        else
            render(json: {error: "the employee id is not found #{@employee.id}"},status: 404)
        end
        end

        # destroy a particular employee object
        def destroy
            if Employee.exists?(params[:id])
            @employee = Employee.find(params[:id])
            @employee.destroy
             render(json: {success: "the employee data is deleted for #{@employee.id}"},status: 200)
            else
                render(json: {error: "the employee id is not found #{params[:id]}"},status: 404)
            end
        end
        # create an expense report for the expenses of an employee
        def expense_report(employee_id)
            if Employee.exists?(employee_id)
                @employee=Employee.find(employee_id)
                expenses_json=[]
                @employee.expenses.each do |expense|
                    expenses_json << expense.to_json
                end
               # render(json: {success: "the expenses for #{@employee.id} is: #{expenses_json}"}, status: 200)
            else
               render(json: {error: "the employee id is not present"}, status: 404)
           end
        end
end