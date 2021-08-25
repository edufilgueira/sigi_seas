require 'rails_helper'

RSpec.describe "socioeduk/tipo_ocorrencias/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_ocorrencias, [
      Socioeduk::TipoOcorrencia.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoOcorrencia.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_ocorrencias" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
