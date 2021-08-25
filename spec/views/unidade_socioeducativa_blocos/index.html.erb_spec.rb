require 'rails_helper'

RSpec.describe "unidade_socioeducativa_blocos/index", type: :view do
  before(:each) do
    assign(:unidade_socioeducativa_blocos, [
      UnidadeSocioeducativaBloco.create!(
        :descricao => "Descricao",
        :unidades_socioeducativas => nil
      ),
      UnidadeSocioeducativaBloco.create!(
        :descricao => "Descricao",
        :unidades_socioeducativas => nil
      )
    ])
  end

  it "renders a list of unidade_socioeducativa_blocos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
