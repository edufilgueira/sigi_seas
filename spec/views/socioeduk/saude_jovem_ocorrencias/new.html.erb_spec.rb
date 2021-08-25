require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_ocorrencias/new", type: :view do
  before(:each) do
    assign(:socioeduk_saude_jovem_ocorrencia, Socioeduk::SaudeJovemOcorrencia.new(
      :socioeduk_jovem_recepcao => nil,
      :socioeduk_tipo_atendimento => nil,
      :observacao => "MyText"
    ))
  end

  it "renders new socioeduk_saude_jovem_ocorrencia form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_saude_jovem_ocorrencias_path, "post" do

      assert_select "input[name=?]", "socioeduk_saude_jovem_ocorrencia[socioeduk_jovem_recepcao_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_ocorrencia[socioeduk_tipo_atendimento_id]"

      assert_select "textarea[name=?]", "socioeduk_saude_jovem_ocorrencia[observacao]"
    end
  end
end
