require "spec_helper"

describe HasSeoFields do

  subject { City.create :name => 'Los Angeles' }

  it "defines methods" do
    subject.should respond_to('seo_h1_tag', 'seo_title')
  end

  it "sets SEO_NAMES" do
    subject.class::SEO_NAMES.should eql({ :seo_h1_tag => 'It is your city!', :seo_title => 'Clubs, bars, etc.' })
  end

  context "getters" do

    it "finds existing record by the name" do
      subject.seo_fields.create :name => 'seo_h1_tag', :value => 'Cool!'
      subject.seo_h1_tag.should eql('Cool!')
    end

    it "returns the default value if nothing founded" do
      subject.seo_title.should eql('Clubs, bars, etc.')
    end
  end

  context "setters" do

    it "defines setter methods" do
      subject.should respond_to('seo_h1_tag=', 'seo_title=')
    end

    describe "seo field with name that does not exists" do

      it "creates needed seo field with given value" do
        subject.seo_h1_tag='Cool city'
        subject.seo_fields.should have(1).item
        subject.seo_fields.find_by_name('seo_h1_tag').value.should eql('Cool city')
      end

      it "does note creates seo field if given value equals the default one" do
        subject.seo_title = 'Clubs, bars, etc.'
        subject.seo_fields.should have(0).item
      end

      describe "when empty string given" do

        it "does not creates entries with empty strings as values" do
          subject.seo_h1_tag = ''
          subject.seo_fields.should have(0).items
        end

        it "removes existing record if present" do
          subject.seo_fields.create :name => 'seo_h1_tag', :value => 'Cool!'
          seo_title = subject.seo_fields.create :name => 'seo_title', :value => 'Best city ever!'
          subject.seo_h1_tag = ''
          subject.reload

          subject.seo_fields.should eql([seo_title])
        end
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
