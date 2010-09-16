class User
  include ActiveModel::Validations

  attr_accessor :email_address

  validates :email_address, :email => true
end