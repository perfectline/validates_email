require 'active_model'
require 'active_model/validations'
require 'active_support/concern'
require 'mail'

module Perfectline
  module ValidatesEmail
    extend ActiveSupport::Concern

    class EmailValidator < ActiveModel::EachValidator
      def initialize(options)
        options[:message] ||= "is not a valid email"
        super(options)
      end

      def validate_each(record, attribute, value)
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

ActiveModel::Validations.send(:include, Perfectline::ValidatesEmail)
