require "active_record"
require "has_seo_fields/version"

module HasSeoFields
  extend ActiveSupport::Concern

  included do

  end

  module ClassMethods
    def has_seo_fields *args

    end

  end
end

ActiveRecord::Base.send :include, HasSeoFields


=begin

module ActiveRecord
  module ActsAsSeoptimizable
    extend ActiveSupport::Concern

    included do
      has_many :seo_fields, :as => :optimizable
    end

    module ClassMethods

      def acts_as_seoptimizable *args
        const_set 'SEO_NAMES', args

        args.each do |field|
          define_method "seo_#{field}" do
            seo_fields.find_by_name field
          end
          end
        end
      end
    end

    module InstanceMethods
    end
  end
end

ActiveRecord::Base.send :include, ActiveRecord::ActsAsSeoptimizable
=end
