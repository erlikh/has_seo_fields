class City < ActiveRecord::Base
  has_seo_fields :h1_tag, :title
end
