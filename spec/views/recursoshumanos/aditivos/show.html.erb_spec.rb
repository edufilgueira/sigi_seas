require 'rails_helper'

RSpec.describe "recursoshumanos/aditivos/show", type: :view do
  before(:each) do
    @recursoshumanos_aditivo = assign(:recursoshumanos_aditivo, Recursoshumanos::Aditivo.create!(
      :recursoshumanos_contrato => nil,
      :recursoshumanos_justificativa_aditivo => nil,
      :numero_processo => "Numero Processo",
      :descricao => "Descricao"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Numero Processo/)
    expect(rendered).to match(/Descricao/)
  end
end
