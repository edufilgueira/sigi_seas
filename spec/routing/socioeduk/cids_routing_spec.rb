require "rails_helper"

RSpec.describe Socioeduk::CidsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/cids").to route_to("socioeduk/cids#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/cids/new").to route_to("socioeduk/cids#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/cids/1").to route_to("socioeduk/cids#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/cids/1/edit").to route_to("socioeduk/cids#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/cids").to route_to("socioeduk/cids#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/cids/1").to route_to("socioeduk/cids#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/cids/1").to route_to("socioeduk/cids#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/cids/1").to route_to("socioeduk/cids#destroy", :id => "1")
    end

  end
end
