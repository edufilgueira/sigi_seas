require "rails_helper"

RSpec.describe Socioeduk::VisitantesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/visitantes").to route_to("socioeduk/visitantes#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/visitantes/new").to route_to("socioeduk/visitantes#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/visitantes/1").to route_to("socioeduk/visitantes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/visitantes/1/edit").to route_to("socioeduk/visitantes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/visitantes").to route_to("socioeduk/visitantes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/visitantes/1").to route_to("socioeduk/visitantes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/visitantes/1").to route_to("socioeduk/visitantes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/visitantes/1").to route_to("socioeduk/visitantes#destroy", :id => "1")
    end
  end
end
