require "spec_helper"

RSpec.describe RailsTimeseries do
  it "has a version number" do
    expect(RailsTimeseries::VERSION).not_to be nil
  end

  context "when timeseries_scope is defined" do
    class User < ActiveRecord::Base
      include RailsTimeseries
    end

    let(:user) do
      stub_model User, id: 1
    end

    it "should have mock model" do
      expect(Object.const_defined?(:User)).to be_truthy
    end

    it "should have timeseries_scope" do
      expect(User.methods).to include(:timeseries_scope)
    end

    it "creates new method" do
      User.send :timeseries_scope, :some_scope do
        where(id: 1)
      end
      expect(User.methods).to include(:some_scope)
    end
  end
end
