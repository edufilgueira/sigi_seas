require 'rails_helper'

RSpec.describe "socioeduk/jovem_ocorrencias/show", type: :view do
  before(:each) do
    @socioeduk_jovem_ocorrencia = assign(:socioeduk_jovem_ocorrencia, Socioeduk::JovemOcorrencia.create!(
      :socioeduk_jovem => nil,
      :socioeduk_tipo_ocorrencia => nil,
      :descricao => "Descricao"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Descricao/)
  end
end
