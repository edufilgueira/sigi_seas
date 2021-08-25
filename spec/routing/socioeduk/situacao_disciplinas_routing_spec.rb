require "rails_helper"

RSpec.describe Socioeduk::SituacaoDisciplinasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/situacao_disciplinas").to route_to("socioeduk/situacao_disciplinas#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/situacao_disciplinas/new").to route_to("socioeduk/situacao_disciplinas#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/situacao_disciplinas/1").to route_to("socioeduk/situacao_disciplinas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/situacao_disciplinas/1/edit").to route_to("socioeduk/situacao_disciplinas#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/situacao_disciplinas").to route_to("socioeduk/situacao_disciplinas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/situacao_disciplinas/1").to route_to("socioeduk/situacao_disciplinas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/situacao_disciplinas/1").to route_to("socioeduk/situacao_disciplinas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/situacao_disciplinas/1").to route_to("socioeduk/situacao_disciplinas#destroy", :id => "1")
    end
  end
end
