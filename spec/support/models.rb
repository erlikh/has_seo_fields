class City < ActiveRecord::Base
  has_seo_fields :h1_tag, :title
end

class SeoField < ActiveRecord::Base
  belongs_to :optimizable, :polymorphic => true
end
