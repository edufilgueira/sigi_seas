require "rails_helper"

RSpec.describe Socioeduk::TipoTratamentosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/tipo_tratamentos").to route_to("socioeduk/tipo_tratamentos#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/tipo_tratamentos/new").to route_to("socioeduk/tipo_tratamentos#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/tipo_tratamentos/1").to route_to("socioeduk/tipo_tratamentos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/tipo_tratamentos/1/edit").to route_to("socioeduk/tipo_tratamentos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/tipo_tratamentos").to route_to("socioeduk/tipo_tratamentos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/tipo_tratamentos/1").to route_to("socioeduk/tipo_tratamentos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/tipo_tratamentos/1").to route_to("socioeduk/tipo_tratamentos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/tipo_tratamentos/1").to route_to("socioeduk/tipo_tratamentos#destroy", :id => "1")
    end

  end
end
