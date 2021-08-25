require 'rails_helper'

RSpec.describe "socioeduk/composicao_familiares/show", type: :view do
  before(:each) do
    @socioeduk_composicao_familiar = assign(:socioeduk_composicao_familiar, Socioeduk::ComposicaoFamiliar.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
