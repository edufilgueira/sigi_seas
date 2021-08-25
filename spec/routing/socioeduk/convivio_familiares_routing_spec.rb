require "rails_helper"

RSpec.describe Socioeduk::ConvivioFamiliaresController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/convivio_familiares").to route_to("socioeduk/convivio_familiares#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/convivio_familiares/new").to route_to("socioeduk/convivio_familiares#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/convivio_familiares/1").to route_to("socioeduk/convivio_familiares#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/convivio_familiares/1/edit").to route_to("socioeduk/convivio_familiares#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/convivio_familiares").to route_to("socioeduk/convivio_familiares#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/convivio_familiares/1").to route_to("socioeduk/convivio_familiares#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/convivio_familiares/1").to route_to("socioeduk/convivio_familiares#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/convivio_familiares/1").to route_to("socioeduk/convivio_familiares#destroy", :id => "1")
    end
  end
end
