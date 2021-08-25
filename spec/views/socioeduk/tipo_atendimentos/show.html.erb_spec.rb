require 'rails_helper'

RSpec.describe "socioeduk/tipo_atendimentos/show", type: :view do
  before(:each) do
    @socioeduk_tipo_atendimento = assign(:socioeduk_tipo_atendimento, Socioeduk::TipoAtendimento.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
