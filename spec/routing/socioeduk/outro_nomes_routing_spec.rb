require "rails_helper"

RSpec.describe Socioeduk::OutroNomesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/outro_nomes").to route_to("socioeduk/outro_nomes#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/outro_nomes/new").to route_to("socioeduk/outro_nomes#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/outro_nomes/1").to route_to("socioeduk/outro_nomes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/outro_nomes/1/edit").to route_to("socioeduk/outro_nomes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/outro_nomes").to route_to("socioeduk/outro_nomes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/outro_nomes/1").to route_to("socioeduk/outro_nomes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/outro_nomes/1").to route_to("socioeduk/outro_nomes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/outro_nomes/1").to route_to("socioeduk/outro_nomes#destroy", :id => "1")
    end

  end
end
