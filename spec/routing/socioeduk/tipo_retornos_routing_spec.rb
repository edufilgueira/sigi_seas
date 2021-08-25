require "rails_helper"

RSpec.describe Socioeduk::TipoRetornosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/tipo_retornos").to route_to("socioeduk/tipo_retornos#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/tipo_retornos/new").to route_to("socioeduk/tipo_retornos#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/tipo_retornos/1").to route_to("socioeduk/tipo_retornos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/tipo_retornos/1/edit").to route_to("socioeduk/tipo_retornos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/tipo_retornos").to route_to("socioeduk/tipo_retornos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/tipo_retornos/1").to route_to("socioeduk/tipo_retornos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/tipo_retornos/1").to route_to("socioeduk/tipo_retornos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/tipo_retornos/1").to route_to("socioeduk/tipo_retornos#destroy", :id => "1")
    end
  end
end
