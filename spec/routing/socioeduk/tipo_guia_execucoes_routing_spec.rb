require "rails_helper"

RSpec.describe Socioeduk::TipoGuiaExecucoesController, type: :routing do
  describe "routing" do

    xit "routes to #index" do
      expect(:get => "/socioeduk/tipos").to route_to("socioeduk/tipos#index")
    end

    xit "routes to #new" do
      expect(:get => "/socioeduk/tipos/new").to route_to("socioeduk/tipos#new")
    end

    xit "routes to #show" do
      expect(:get => "/socioeduk/tipos/1").to route_to("socioeduk/tipos#show", :id => "1")
    end

    xit "routes to #edit" do
      expect(:get => "/socioeduk/tipos/1/edit").to route_to("socioeduk/tipos#edit", :id => "1")
    end

    xit "routes to #create" do
      expect(:post => "/socioeduk/tipos").to route_to("socioeduk/tipos#create")
    end

    xit "routes to #update via PUT" do
      expect(:put => "/socioeduk/tipos/1").to route_to("socioeduk/tipos#update", :id => "1")
    end

    xit "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/tipos/1").to route_to("socioeduk/tipos#update", :id => "1")
    end

    xit "routes to #destroy" do
      expect(:delete => "/socioeduk/tipos/1").to route_to("socioeduk/tipos#destroy", :id => "1")
    end

  end
end
