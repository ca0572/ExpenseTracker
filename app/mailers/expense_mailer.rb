class ExpenseMailer < ApplicationMailer
    default from: 'prakash.mamidi97@gmail.com'
    def expense_report_mail
        mail(to: params[:user], body: params[:email_body], content_type: "text/html", subject: "expense reimburshed")
    end
end
