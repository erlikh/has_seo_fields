require "spec_helper"

describe HasSeoFields do
  subject { City.create :name => 'Los Angeles' }

  it "defines methods" do
    subject.should respond_to('seo_h1_tag', 'seo_title')
  end
end

#describe ActiveRecord::ActsAsSeoptimizable do
#
#  subject do { City.new }
#
#  subject do
#    build_nullable_class ActiveRecord::Base do
#      set_table_name "cities"
#      acts_as_seoptimizable :link_title, :description
#    end.create
#  end
#
#  it "defines seo methods" do
#    subject.should respond_to('seo_link_title', 'seo_description')
#  end
#
#  it "sets SEO_NAMES " do
#    subject.class::SEO_NAMES.should eql([:link_title, :description])
#  end
#
#  context "seo_method" do
#
#    before :each do
#      @seo_field = Factory :seo_field, :optimizable => subject
#     # subject.seo_fields << @seo_field
#    end
#
#    it "set the getters" do
#      subject.seo_link_title.should eql(@seo_field)
#    end
#  end
#end
