require "rails_helper"

RSpec.describe Socioeduk::TipoMedidaSocioeducativasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/tipo_medida_socioeducativas").to route_to("socioeduk/tipo_medida_socioeducativas#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/tipo_medida_socioeducativas/new").to route_to("socioeduk/tipo_medida_socioeducativas#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/tipo_medida_socioeducativas/1").to route_to("socioeduk/tipo_medida_socioeducativas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/tipo_medida_socioeducativas/1/edit").to route_to("socioeduk/tipo_medida_socioeducativas#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/tipo_medida_socioeducativas").to route_to("socioeduk/tipo_medida_socioeducativas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/tipo_medida_socioeducativas/1").to route_to("socioeduk/tipo_medida_socioeducativas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/tipo_medida_socioeducativas/1").to route_to("socioeduk/tipo_medida_socioeducativas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/tipo_medida_socioeducativas/1").to route_to("socioeduk/tipo_medida_socioeducativas#destroy", :id => "1")
    end
  end
end
