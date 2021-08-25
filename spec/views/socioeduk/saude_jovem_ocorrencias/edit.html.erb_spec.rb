require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_ocorrencias/edit", type: :view do
  before(:each) do
    @socioeduk_saude_jovem_ocorrencia = assign(:socioeduk_saude_jovem_ocorrencia, Socioeduk::SaudeJovemOcorrencia.create!(
      :socioeduk_jovem_recepcao => nil,
      :socioeduk_tipo_atendimento => nil,
      :observacao => "MyText"
    ))
  end

  it "renders the edit socioeduk_saude_jovem_ocorrencia form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_saude_jovem_ocorrencia_path(@socioeduk_saude_jovem_ocorrencia), "post" do

      assert_select "input[name=?]", "socioeduk_saude_jovem_ocorrencia[socioeduk_jovem_recepcao_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_ocorrencia[socioeduk_tipo_atendimento_id]"

      assert_select "textarea[name=?]", "socioeduk_saude_jovem_ocorrencia[observacao]"
    end
  end
end
