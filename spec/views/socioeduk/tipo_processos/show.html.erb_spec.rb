require 'rails_helper'

RSpec.describe "socioeduk/tipo_processos/show", type: :view do
  before(:each) do
    @socioeduk_tipo_processo = assign(:socioeduk_tipo_processo, Socioeduk::TipoProcesso.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
