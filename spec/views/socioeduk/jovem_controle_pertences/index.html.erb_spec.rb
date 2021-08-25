require 'rails_helper'

RSpec.describe "socioeduk/jovem_controle_pertences/index", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_controle_pertences, [
      Socioeduk::JovemControlePertence.create!(
        :socioeduk_jovem_recepcao => nil,
        :nome => "Nome",
        :recebente => "Recebente",
        :entregador => "Entregador",
        :usuario_new => 2,
        :usuario_update => 3
      ),
      Socioeduk::JovemControlePertence.create!(
        :socioeduk_jovem_recepcao => nil,
        :nome => "Nome",
        :recebente => "Recebente",
        :entregador => "Entregador",
        :usuario_new => 2,
        :usuario_update => 3
      )
    ])
  end

  it "renders a list of socioeduk/jovem_controle_pertences" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Recebente".to_s, :count => 2
    assert_select "tr>td", :text => "Entregador".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
