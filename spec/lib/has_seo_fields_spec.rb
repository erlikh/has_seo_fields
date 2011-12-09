require "spec_helper"

describe HasSeoFields do

  subject { City.create :name => 'Los Angeles' }

  it "defines methods" do
    subject.should respond_to('seo_h1_tag', 'seo_title')
  end

  it "sets SEO_NAMES" do
    subject.class::SEO_NAMES.should eql([:h1_tag, :title])
  end

  context "setters" do

    it "defines setter methods" do
      subject.should respond_to('seo_h1_tag=', 'seo_title=')
    end

    describe "seo field with that name does not exists" do

      it "create needed seo field with given value" do
        subject.seo_h1_tag='Cool city'
        subject.seo_fields.where(:name => 'seo_h1_tag').should have(1).item
      end
    end

    describe "already exists" do

      before :each do
        subject.seo_fields.create :name => 'seo_h1_tag', :value => 'Cool!'
        subject.seo_h1_tag = 'Super city'
      end

      it "does not creates new entry" do
        subject.seo_fields.should have(1).item
      end

      it "updates value of the existing entry" do
        subject.seo_fields.find_by_name('seo_h1_tag').value.should eql('Super city')
      end
    end
  end
end
