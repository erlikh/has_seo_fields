require "active_record"
require "has_seo_fields/version"

module HasSeoFields
  extend ActiveSupport::Concern

  included do
    has_many :seo_fields, :as => :optimizable
  end

  module ClassMethods
    def has_seo_fields *args

      args.map! do |field|
        getter_name = "seo_#{field}"

        define_method getter_name do
          field.value if (field = seo_fields.find_by_name getter_name)
        end

        define_method "#{getter_name}=" do |value|
          if (field = seo_fields.find_by_name getter_name)
            field.update_attribute :value, value
          elsif value.present?
            seo_fields.create :name => getter_name, :value => value
          end
        end
        getter_name
      end
      const_set "SEO_NAMES", args
    end
  end
end

ActiveRecord::Base.send :include, HasSeoFields
