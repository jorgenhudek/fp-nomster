class NotificationMailer < ApplicationMailer
  def comment_added
    mail(to: "o.bulkin@gmail.com", subject: "A comment has been added to your place")
  end
end