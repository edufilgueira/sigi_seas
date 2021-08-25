require 'rails_helper'

RSpec.describe "recursoshumanos/justificativa_aditivos/index", type: :view do
  before(:each) do
    assign(:recursoshumanos_justificativa_aditivos, [
      Recursoshumanos::JustificativaAditivo.create!(
        :descricao => "Descricao"
      ),
      Recursoshumanos::JustificativaAditivo.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of recursoshumanos/justificativa_aditivos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
