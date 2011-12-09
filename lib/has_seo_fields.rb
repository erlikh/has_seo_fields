require "active_record"
require "has_seo_fields/version"

module HasSeoFields
  extend ActiveSupport::Concern

  included do
    has_many :seo_fields, :as => :optimizable
  end

  module ClassMethods
    def has_seo_fields *args
      const_set "SEO_NAMES", args

      args.each do |field|
        getter_name = "seo_#{field}"

        define_method getter_name do
        end

        define_method "#{getter_name}=" do |value|
          if (field = seo_fields.find_by_name(getter_name))
            field.update_attribute :value, value
          else
            seo_fields.create :name => getter_name, :value => value
          end
        end
      end
    end
  end

  module InstanceMethods
  end
end

ActiveRecord::Base.send :include, HasSeoFields
