class CommentsController < ApplicationController

    #adding comments for the created expense
    def create
        @expense=Expense.find(comment_params[:expense_id])
        @comment=@expense.comments.new(comment_params)
        #@comment = Comment.new(db_params)
        @comment.save!
        if !reply_flag_param[:reply_flag]
            ExpenseMailer.with(user: Employee.find(@expense.employee_id).email_id, email_body: "the comment sent by admin is #{comment_params[:body]}").expense_report_mail.deliver_later
        end
        render(json: {success: "the comment is created with comment id #{@comment.id}"}, status: 201)
    end
    
    private
    
    def comment_params
        params.permit(:expense_id,:title,:body)
    end
    def reply_flag_param
        params.permit(:reply_flag)
    end
end
