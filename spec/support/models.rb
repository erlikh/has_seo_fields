class City < ActiveRecord::Base
  has_seo_fields :h1_tag => 'It is your city!', :title => 'Clubs, bars, etc.'
end

class SeoField < ActiveRecord::Base
  belongs_to :optimizable, :polymorphic => true
end
