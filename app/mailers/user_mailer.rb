class UserMailer < ApplicationMailer
  default from: "notifications@example.com"

  def send_result_exam exam
    @exam = exam
    @user = exam.user
    mail to: @user.email, subject: t "mail.exam_subject"
  end
end
