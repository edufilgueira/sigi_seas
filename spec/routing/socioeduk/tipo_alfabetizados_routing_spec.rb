require "rails_helper"

RSpec.describe Socioeduk::TipoAlfabetizadosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/tipo_alfabetizados").to route_to("socioeduk/tipo_alfabetizados#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/tipo_alfabetizados/new").to route_to("socioeduk/tipo_alfabetizados#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/tipo_alfabetizados/1").to route_to("socioeduk/tipo_alfabetizados#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/tipo_alfabetizados/1/edit").to route_to("socioeduk/tipo_alfabetizados#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/tipo_alfabetizados").to route_to("socioeduk/tipo_alfabetizados#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/tipo_alfabetizados/1").to route_to("socioeduk/tipo_alfabetizados#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/tipo_alfabetizados/1").to route_to("socioeduk/tipo_alfabetizados#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/tipo_alfabetizados/1").to route_to("socioeduk/tipo_alfabetizados#destroy", :id => "1")
    end
  end
end
