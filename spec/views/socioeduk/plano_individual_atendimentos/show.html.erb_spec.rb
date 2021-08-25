require 'rails_helper'

RSpec.describe "socioeduk/plano_individual_atendimentos/show", type: :view do
  before(:each) do
    @socioeduk_plano_individual_atendimento = assign(:socioeduk_plano_individual_atendimento, Socioeduk::PlanoIndividualAtendimento.create!(
      :descricao => "Descricao"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
