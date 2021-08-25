require 'rails_helper'

RSpec.describe "recursoshumanos/justificativa_aditivos/show", type: :view do
  before(:each) do
    @recursoshumanos_justificativa_aditivo = assign(:recursoshumanos_justificativa_aditivo, Recursoshumanos::JustificativaAditivo.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
