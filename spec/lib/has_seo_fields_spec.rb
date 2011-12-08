require "spec_helper"

describe HasSeoFields do

  subject { City.create :name => 'Los Angeles' }

  it "defines methods" do
    subject.should respond_to('seo_h1_tag', 'seo_title')
  end

  it "sets SEO_NAMES" do
    subject.class::SEO_NAMES.should eql([:h1_tag, :title])
  end
end
