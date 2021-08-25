require 'rails_helper'

RSpec.describe "recursoshumanos/aditivos/index", type: :view do
  before(:each) do
    assign(:recursoshumanos_aditivos, [
      Recursoshumanos::Aditivo.create!(
        :recursoshumanos_contrato => nil,
        :recursoshumanos_justificativa_aditivo => nil,
        :numero_processo => "Numero Processo",
        :descricao => "Descricao"
      ),
      Recursoshumanos::Aditivo.create!(
        :recursoshumanos_contrato => nil,
        :recursoshumanos_justificativa_aditivo => nil,
        :numero_processo => "Numero Processo",
        :descricao => "Descricao"
      )
    ])
  end

  xit "renders a list of recursoshumanos/aditivos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Numero Processo".to_s, :count => 2
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
