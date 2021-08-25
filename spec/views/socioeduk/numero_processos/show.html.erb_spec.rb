require 'rails_helper'

RSpec.describe "socioeduk/numero_processos/show", type: :view do
  before(:each) do
    @socioeduk_numero_processo = assign(:socioeduk_numero_processo, Socioeduk::NumeroProcesso.create!(
      :socioeduk_processo => nil,
      :numero => "Numero"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Numero/)
  end
end
