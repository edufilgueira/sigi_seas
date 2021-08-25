require "rails_helper"

RSpec.describe Socioeduk::SituacaoEscolaresController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/situacao_escolares").to route_to("socioeduk/situacao_escolares#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/situacao_escolares/new").to route_to("socioeduk/situacao_escolares#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/situacao_escolares/1").to route_to("socioeduk/situacao_escolares#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/situacao_escolares/1/edit").to route_to("socioeduk/situacao_escolares#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/situacao_escolares").to route_to("socioeduk/situacao_escolares#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/situacao_escolares/1").to route_to("socioeduk/situacao_escolares#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/situacao_escolares/1").to route_to("socioeduk/situacao_escolares#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/situacao_escolares/1").to route_to("socioeduk/situacao_escolares#destroy", :id => "1")
    end
  end
end
