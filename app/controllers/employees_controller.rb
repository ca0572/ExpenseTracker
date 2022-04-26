class EmployeesController < ApplicationController
  # include EmployeeModule 
  before_action :set_employee, only: [:update_status, :update]

   # to onboard an employee to our application
    def create
        puts "the receive employee params are: #{employee_params.to_json}"
        @employee=Employee.new(employee_params)
       if  @employee.save!
            render(json: {success: "the employee is created with employee id #{@employee.id}"}, status: 201)
       end
    end

    # to update an onboarded employee
    def update
        employee_params.each do |key,value|
            @employee.update!(key => value) if value!=nil && !value.blank? 
        end
        render(json: {success: "the employee data is updated for the employee_id - #{@employee.id}"}, status: 200)
    end

    def update_status
        @employee.update!(status: status_param[:status])
    end

    private

    def employee_params 
        params.permit(:employee_name, :phone_no, :employee_department, :email_id)
    end

    def set_employee
        @employee = Employee.find(params[:id])
    end

end