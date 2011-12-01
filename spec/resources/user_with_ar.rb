class UserWithAr < ActiveRecord::Base
  self.table_name = "users"

  validates :email_address, :email => { :message => "is not right" }
end