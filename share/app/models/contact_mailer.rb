# -*- coding: utf-8 -*-
class ContactMailer < ActionMailer::Base
   def contact(contact)
    subject    "プランについて"
    recipients contact.customer.email
    from       contact.email
    sent_on    Time.now

    body       :body => contact.body, :email => contact.email, :name => contact.name, :date => contact.created_at, :content => contact.content
  end

end
