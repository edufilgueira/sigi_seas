require 'rails_helper'

RSpec.describe "socioeduk/tipo_vacinas/show", type: :view do
  before(:each) do
    @socioeduk_tipo_vacina = assign(:socioeduk_tipo_vacina, Socioeduk::TipoVacina.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
