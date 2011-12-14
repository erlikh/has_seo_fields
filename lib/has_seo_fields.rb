require "active_record"
require "has_seo_fields/version"

module HasSeoFields
  extend ActiveSupport::Concern

  included do
    has_many :seo_fields, :as => :optimizable
  end

  module ClassMethods
    def has_seo_fields options
      @@seo_names = {}

      options.each do |key, v|
        getter_name = :"seo_#{key}"

        # @city.seo_h1_tag
        define_method getter_name do
          if field = seo_fields.find_by_name(getter_name)
            field.value
          else
            @@seo_names[getter_name]
          end
        end

        # @city.seo_h1_tag=
        define_method "#{getter_name}=" do |value|
          field = seo_fields.find_or_initialize_by_name getter_name
          return field.destroy if value.empty? || value == @@seo_names[getter_name]

          field.update_attribute(:value, value)
        end

        @@seo_names[getter_name] = v
      end

      const_set "SEO_NAMES", @@seo_names
    end
  end
end

ActiveRecord::Base.send :include, HasSeoFields
