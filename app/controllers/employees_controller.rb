class EmployeesController < ApplicationController
   include EmployeeModule 
   # to onboard an employee to our application
    def create
        employee_details=employee_params 
        employee_details[:status]="onboarded"
        @employee=Employee.new(employee_details)
       if  @employee.save
        render(json: {success: "the emplotee is created with employee id #{@employee.id}"}, status: 201)
       else
        render(json: {error: "bad request"},status: 400)
       end
    end
    # to update an onboarded employee
    def update
        employee_details=employee_params 
        employee_details[:status]="onboarded"
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)
        render(json: {success: "the employee data is updated for the employee_id - #{@employee.id}"}, status: 201)
    end
    def employee_params 
        params.permit(:employee_name, :phone_no, :employee_department, :email_id)
    end
end