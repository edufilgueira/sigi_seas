require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_ocorrencias/index", type: :view do
  before(:each) do
    assign(:socioeduk_saude_jovem_ocorrencias, [
      Socioeduk::SaudeJovemOcorrencia.create!(
        :socioeduk_jovem_recepcao => nil,
        :socioeduk_tipo_atendimento => nil,
        :observacao => "MyText"
      ),
      Socioeduk::SaudeJovemOcorrencia.create!(
        :socioeduk_jovem_recepcao => nil,
        :socioeduk_tipo_atendimento => nil,
        :observacao => "MyText"
      )
    ])
  end

  it "renders a list of socioeduk/saude_jovem_ocorrencias" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
