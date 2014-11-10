require 'spec_helper'

describe JpPost::Tracking do
  describe "#initialize" do
    it "should not initialize without tracking number argument" do
      expect { JpPost::Tracking.new() }.to raise_error(ArgumentError)
    end

    it "should initialize a tracking object" do
      VCR.use_cassette 'working_tracking' do
        package = JpPost::Tracking.new("EL015307999JP")
        expect(package).to be_kind_of(JpPost::Tracking)
      end
    end
  end

  describe "#classification" do
    it "should return a classification string" do
      VCR.use_cassette 'working_tracking' do
        package = JpPost::Tracking.new("EL015307999JP")
        expect(package.classification).to be_kind_of(String)
      end
    end

    it "should return nil with empty tracking number" do
      VCR.use_cassette 'empty_tracking' do
        package = JpPost::Tracking.new("EL015307999123JP")
        expect(package.classification).to be_nil
      end
    end
  end

  describe "#history" do
    it "should return a history array" do
      VCR.use_cassette 'working_tracking' do
        package = JpPost::Tracking.new("EL015307999JP")
        expect(package.history).to be_kind_of(Array)
      end
    end

    it "should return nil with empty tracking number" do
      VCR.use_cassette 'empty_tracking' do
        package = JpPost::Tracking.new("EL015307999123JP")
        expect(package.history).to be_nil
      end
    end
  end

end
