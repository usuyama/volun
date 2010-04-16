class Customer < ActiveRecord::Base
  has_many :contents
  validates_presence_of :id,:address, :email, :person_in_charge
  validates_uniqueness_of :id, :email
  validates_numericality_of :id
  validates_format_of :email, :with => /A([^@\s]+)@((?:[-a-z0-9]+\.)[a-z]{2,})\Z/i
end
