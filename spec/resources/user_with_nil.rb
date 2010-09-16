class UserWithNil
  include ActiveModel::Validations

  attr_accessor :email_address

  validates :email_address, :email => {:allow_nil => true}
end