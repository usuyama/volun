class Contact < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user
  belongs_to :content

  validates_presence_of  :email, :body, :name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

end
