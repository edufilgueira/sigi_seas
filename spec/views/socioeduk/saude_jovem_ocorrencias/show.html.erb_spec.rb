require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_ocorrencias/show", type: :view do
  before(:each) do
    @socioeduk_saude_jovem_ocorrencia = assign(:socioeduk_saude_jovem_ocorrencia, Socioeduk::SaudeJovemOcorrencia.create!(
      :socioeduk_jovem_recepcao => nil,
      :socioeduk_tipo_atendimento => nil,
      :observacao => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
