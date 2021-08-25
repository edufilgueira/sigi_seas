require "rails_helper"

RSpec.describe Socioeduk::PedagogicoJovemProfissionalizantesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/pedagogico_jovem_profissionalizantes").to route_to("socioeduk/pedagogico_jovem_profissionalizantes#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/pedagogico_jovem_profissionalizantes/new").to route_to("socioeduk/pedagogico_jovem_profissionalizantes#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/pedagogico_jovem_profissionalizantes/1").to route_to("socioeduk/pedagogico_jovem_profissionalizantes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/pedagogico_jovem_profissionalizantes/1/edit").to route_to("socioeduk/pedagogico_jovem_profissionalizantes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/pedagogico_jovem_profissionalizantes").to route_to("socioeduk/pedagogico_jovem_profissionalizantes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/pedagogico_jovem_profissionalizantes/1").to route_to("socioeduk/pedagogico_jovem_profissionalizantes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/pedagogico_jovem_profissionalizantes/1").to route_to("socioeduk/pedagogico_jovem_profissionalizantes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/pedagogico_jovem_profissionalizantes/1").to route_to("socioeduk/pedagogico_jovem_profissionalizantes#destroy", :id => "1")
    end
  end
end
