require 'rails_helper'

RSpec.describe "socioeduk/tipo_tratamentos/show", type: :view do
  before(:each) do
    @socioeduk_tipo_tratamento = assign(:socioeduk_tipo_tratamento, Socioeduk::TipoTratamento.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
