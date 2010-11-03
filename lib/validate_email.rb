require 'active_model'
require 'mail'

module ActiveModel
  module Validations
    class EmailValidator < ActiveModel::EachValidator
      
      def initialize(options)
        options.reverse_merge!(:message => "is not a valid email address")
        super(options)
      end

      def validate_each(record, attribute, value)
        return if options[:allow_nil] && value.nil?

        begin
          mail = Mail::Address.new(value)

          unless mail.address == value && mail.domain.split(".").length > 1
            record.errors.add(attribute, options[:message])
          end
        rescue
          record.errors.add(attribute, options[:message])
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

