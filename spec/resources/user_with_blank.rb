class UserWithBlank
  include ActiveModel::Validations

  attr_accessor :email_address

  validates :email_address, :email => {:allow_blank => true}
end