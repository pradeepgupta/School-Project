# encoding: utf-8

module Machinist
  module ActiveRecord
    module Extensions
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      module ClassMethods
        # Added class method make_unvalidated: Construct objects without performing validations (ActiveRecord + DataMapper).
        def make_unvalidated(*args)
          object = self.make_unsaved(*args)
          object.save(false)
          object
        end
      end
    end
  end
end

class ActiveRecord::Base
  include Machinist::ActiveRecord::Extensions
end