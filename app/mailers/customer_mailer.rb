class CustomerMailer < ActionMailer::Base
  default from: "from@example.com"

  def status_email(status, ticket)
    @status = Status.find(status)
    @ticket = ticket
    mail(to: ticket.customer.email, subject: 'Status of your ticket updated')
  end
end
