require 'rails_helper'

RSpec.describe "socioeduk/tipos/show", type: :view do
  before(:each) do
    @socioeduk_tipo = assign(:socioeduk_tipo, Socioeduk::TipoGuiaExecucao.create!(
      :descricao => "Descricao"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
