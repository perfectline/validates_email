require 'mail'

module ActiveModel
  module Validations
    class EmailValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        begin
          mail = Mail::Address.new(value)

          unless mail.address == value && mail.domain.split(".").length > 1
            record.errors.add(attribute, :invalid_email, :default => options[:message], :value => value)
          end
        rescue
          record.errors.add(attribute, :invalid_email, :default => options[:message], :value => value)
        end
      end
    end

    module ClassMethods
      def validates_email(*attr_names)
        validates_with EmailValidator, _merge_attributes(attr_names)
      end
    end
  end
end

