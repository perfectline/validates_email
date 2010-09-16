class UserWithArLegacy < ActiveRecord::Base
  self.table_name = "users"

  validates_email :email_address
end