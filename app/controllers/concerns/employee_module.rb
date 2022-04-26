module EmployeeModule

    # get the employee object
        def show
            set_employee
            render(json: {success: "the employee data retrived is #{@employee.to_json}"},status: 200) 
        end

        # destroy a particular employee object
        def destroy
            set_employee
            if @employee.destroy!
                render(json: {success: "the employee data is deleted for #{@employee.id}"},status: 200)
            end
        end

        # create an expense report for the expenses of an employee
        def employee_expense_report(employee_id)
            puts "the employee id is #{employee_id}"
            @employee=Employee.find(employee_id)
            #expenses_json=[]
            #@employee.expenses.each do |expense|
             #   expenses_json << expense.to_json
          #  end
               # render(json: {success: "the expenses for #{@employee.id} is: #{expenses_json}"}, status: 200)
        end

        private 

        def set_employee
            @employee = Employee.find(params[:id])
        end
end