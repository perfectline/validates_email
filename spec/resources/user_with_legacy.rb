class UserWithLegacy
  include ActiveModel::Validations

  attr_accessor :email_address

  validates_email :email_address, :allow_blank => true, :message => "is just wrong!"
end